import numpy as np
import VoxelWorld
import csv
import os

# Dimensions of world in meters
LENGTH = 60
WIDTH = 60
HEIGHT = 30

# Side length of cubic voxel (resolution)
RES = 1.0

# Number of object classes we are working with here
NUM_CLASSES = 6
CLASSDICT = {'vegetation': 0,
             'sky': 1,
             'pole': 2,
             'sidewalk': 3,
             'building': 4,
             'ego vehicle': 5,
             'rectification': 6,
             'traffic sign': 7}

# Camera properties such as focal length, max width and height in frame
# at focal length in front of camera, and frame rate of camera
CAMERA_FL = 15
CAMERA_WIDTH = 29
CAMERA_HEIGHT = 19
FRAME_RATE = 30  # 30 fps

# Frame properties
FRAME_WIDTH = 800
FRAME_HEIGHT = 600

EDGE_SHARPNESS = 10.0

INPUTPATH = '/Users/anshulramachandran/Downloads/data_log.csv'
SAVEPATH = '/Users/anshulramachandran/Desktop/dronelogs/'
RUNNAME = 'delmarcourtyard1'

if not os.path.isdir(os.path.join(SAVEPATH, RUNNAME)):
    os.makedirs(os.path.join(SAVEPATH, RUNNAME))


world = VoxelWorld.VoxelWorld(int(LENGTH/RES), int(WIDTH/RES), int(HEIGHT/RES), NUM_CLASSES)


def write_config(path):
    f = open(path, 'w')
    f.write(RUNNAME + '\n')
    f.write(INPUTPATH + '\n')
    f.write('numclasses:' + str(NUM_CLASSES) + '\n')
    f.write('length:' + str(LENGTH) + '\n')
    f.write('width:' + str(WIDTH) + '\n')
    f.write('height:' + str(HEIGHT) + '\n')
    f.write('res:' + str(RES) + '\n')
    f.close()

write_config(os.path.join(SAVEPATH, RUNNAME, 'config.txt'))

def get_voxel_object_value(conf, dist):
    # TODO(anshul): make some stupid heuristic based on confidence and distance
    # can easily modify once we put in depth map (gaussian around dist)
    value = conf
    return value


def get_3d_point(dist_unit, vref_unit, dc, sinc, cosc, framec):

    [u, v, w] = vref_unit
    [q, r, s] = dist_unit

    crossterm = s*s*(u*u+v*v) + q*q*(v*v+w*w) +r*r*(u*u+w*w) - 2*q*s*u*w - 2*q*r*u*v - 2*r*s*v*w

    xdet = dc*dc * (-cosc*cosc * (q*q+r*r+s*s) + crossterm)
    xnum = cosc*dc*(u*(r*r+s*s) - q*(r*v+s*w))

    ydet = dc*dc * (-cosc*cosc * (q*q+r*r+s*s) + crossterm)
    ynum = cosc*dc*(v*(q*q+s*s) - r*(q*u+s*w))

    zdet = dc*dc * (-cosc*cosc * (q*q+r*r+s*s) + crossterm)
    znum = cosc*dc*(w*(r*r+q*q) - s*(q*u+r*v))

    sol1 = [(xnum - (s*v-r*w) * np.sqrt(xdet)) / crossterm,
            (ynum + (s*u-q*w) * np.sqrt(ydet)) / crossterm,
            (znum + (q*v-r*u) * np.sqrt(zdet)) / crossterm]
    sol2 = [(xnum + (s*v-r*w) * np.sqrt(xdet)) / crossterm,
            (ynum - (s*u-q*w) * np.sqrt(ydet)) / crossterm,
            (znum - (q*v-r*u) * np.sqrt(zdet)) / crossterm]
    # If cross product between vref and sol vector is in same direction as
    # dist_unit, then sinc should be negative
    crossp1 = np.cross(vref_unit, sol1)
    crossp2 = np.cross(vref_unit, sol2)

    # print(np.add(sol1, framec),np.add(sol2, framec))
    # print(crossp1, crossp2, dist_unit)
    # print(np.dot(sol1, dist_unit), np.dot(sol2, dist_unit))
    # print(cosc,  np.dot(vref_unit, sol1)/dc, np.dot(vref_unit, sol2)/dc)
    # print(dc*dc, np.sum(np.square(sol1)), np.sum(np.square(sol2)))

    if sinc >= 0:
        if np.sum(np.multiply(crossp1, dist_unit) > 0) == 0:
            return np.add(sol1, framec)
        elif np.sum(np.multiply(crossp2, dist_unit) > 0) == 0:
            return np.add(sol2, framec)
        else:
            print('Well that didnt work awks')
            assert(False)
    else:
        if np.sum(np.multiply(crossp1, dist_unit) >= 0) == 3:
            return np.add(sol1, framec)
        elif np.sum(np.multiply(crossp2, dist_unit) >= 0) == 3:
            return np.add(sol2, framec)
        else:
            print('Well that didnt work awks')
            assert(False)

    return [0,0,0]

#get_3d_point(dist_unit, vref_unit, dc, sinc, cosc, framec)
# dist_unit = [0,1,0]
# vref_unit = np.cross(dist_unit, [0, 0, 1])
# print(vref_unit)
# print(get_3d_point(dist_unit, vref_unit, 1, -np.sqrt(2)/2, np.sqrt(2)/2, [0,1,0]))

def rotate_point_around_vector(pt, vstart, dist_unit, delt):
    [x, y, z] = pt
    [a, b, c] = vstart
    [u, v, w] = dist_unit
    x_new = ((a * (v*v + w*w) -
              u * (b*v + c*w - u*x - v*y - w*z)) * (1 - np.cos(delt)) +
              x * np.cos(delt) +
              (-c*v + b*w - w*y + v*z) * np.sin(delt))
    y_new = ((b * (u*u + w*w) -
              v * (a*u + c*w - u*x - v*y - w*z)) * (1 - np.cos(delt)) +
              y * np.cos(delt) +
              (c*u - a*w + w*x - u*z) * np.sin(delt))
    z_new = ((c * (u*u + v*v) -
              w * (a*u + b*v - u*x - v*y - w*z)) * (1 - np.cos(delt)) +
              z * np.cos(delt) +
              (-b*u + a*v - v*x + u*y) * np.sin(delt))
    return np.asarray([x_new, y_new, z_new])


def get_voxels_at_distance(pos_orient, bbox, dist):
    # essentially takes position and orientation of camera, the bbox within
    # a frame of FRAME_WIDTH x FRAME_HEIGHT dimensions, and gives values
    # of vbox cell assuming object is actually dist distance away
    [xr, yr, zr, phi, delt, thet] = pos_orient
    [xb, yb, xb2, yb2] = bbox
    # wb = yb2 - yb
    # hb = xb2 - xb
    wb = xb2 - xb
    hb = yb2 - yb
    framec = [xr + dist * np.cos(thet) * np.cos(phi),
              yr + dist * np.sin(thet) * np.cos(phi),
              zr + dist * np.sin(phi)]
    # print(framec)
    dist_unit = [np.cos(thet) * np.cos(phi), np.sin(thet) * np.cos(phi), np.sin(phi)]
    vref = np.cross(dist_unit, [0, 0, 1])
    vref_unit = vref / np.sqrt(np.sum(np.square(vref)))

    # print(dist_unit, vref_unit)

    width_ratio = CAMERA_WIDTH * dist / CAMERA_FL
    height_ratio = CAMERA_HEIGHT * dist / CAMERA_FL
    # print(width_ratio, height_ratio)

    tl_dc = np.sqrt(np.sum(np.square(
                [width_ratio * 0.5 - xb * width_ratio/FRAME_WIDTH,
                 height_ratio * 0.5 - yb * height_ratio/FRAME_HEIGHT])))
    tl_cosc = np.absolute((width_ratio * 0.5 - xb * width_ratio/FRAME_WIDTH) / tl_dc)
    tl_sinc = np.absolute((height_ratio * 0.5 - yb * height_ratio/FRAME_HEIGHT) / tl_dc)
    if xb / FRAME_WIDTH < 0.5:
        tl_cosc = -tl_cosc
    if yb / FRAME_HEIGHT > 0.5:
        tl_sinc = -tl_sinc
    tl_3d = get_3d_point(dist_unit, vref_unit, tl_dc, tl_sinc, tl_cosc, framec)
    # print(tl_dc, tl_cosc, tl_sinc, tl_3d)
    if np.equal(tl_3d, [0,0,0]).all():
        return []
    rotated_tl_3d = rotate_point_around_vector(tl_3d, framec, dist_unit, delt)
    # print(tl_dc, tl_cosc, tl_sinc, tl_3d)

    tr_dc = np.sqrt(np.sum(np.square(
                [width_ratio * 0.5 - (xb + wb) * width_ratio/FRAME_WIDTH,
                 height_ratio * 0.5 - yb * height_ratio/FRAME_HEIGHT])))
    tr_cosc = np.absolute((width_ratio * 0.5 - (xb + wb) * width_ratio/FRAME_WIDTH) / tr_dc)
    tr_sinc = np.absolute((height_ratio * 0.5 - yb * height_ratio/FRAME_HEIGHT) / tr_dc)
    if (xb + wb) / FRAME_WIDTH < 0.5:
        tr_cosc = -tr_cosc
    if yb / FRAME_HEIGHT > 0.5:
        tr_sinc = -tr_sinc
    tr_3d = get_3d_point(dist_unit, vref_unit, tr_dc, tr_sinc, tr_cosc, framec)
    if np.equal(tr_3d, [0,0,0]).all():
        return []
    rotated_tr_3d = rotate_point_around_vector(tr_3d, framec, dist_unit, delt)
    # print(tr_dc, tr_cosc, tr_sinc, tr_3d)

    bl_dc = np.sqrt(np.sum(np.square(
                [width_ratio * 0.5 - xb * width_ratio/FRAME_WIDTH,
                 height_ratio * 0.5 - (yb + hb) * height_ratio/FRAME_HEIGHT])))
    bl_cosc = np.absolute((width_ratio * 0.5 - xb * width_ratio/FRAME_WIDTH) / bl_dc)
    bl_sinc = np.absolute((height_ratio * 0.5 - (yb + hb) * height_ratio/FRAME_HEIGHT) / bl_dc)
    if xb / FRAME_WIDTH < 0.5:
        bl_cosc = -bl_cosc
    if (yb + hb) / FRAME_HEIGHT > 0.5:
        bl_sinc = -bl_sinc
    bl_3d = get_3d_point(dist_unit, vref_unit, bl_dc, bl_sinc, bl_cosc, framec)
    if np.equal(bl_3d, [0,0,0]).all():
        return []
    rotated_bl_3d = rotate_point_around_vector(bl_3d, framec, dist_unit, delt)
    # print(bl_dc, bl_cosc, bl_sinc, bl_3d)

    # print(rotated_tl_3d, rotated_tr_3d, rotated_bl_3d)
    lenv1 = np.sqrt(np.sum(np.square(np.subtract(rotated_tr_3d, rotated_tl_3d))))
    lenv2 = np.sqrt(np.sum(np.square(np.subtract(rotated_bl_3d, rotated_tl_3d))))
    # print(lenv1, lenv2)

    vbox_locs = []
    for i in np.linspace(0, 1, int(2*lenv1/RES)):
        for j in np.linspace(0, 1, int(2*lenv2/RES)):
            pt = np.add(rotated_tl_3d, i*np.subtract(rotated_tr_3d, rotated_tl_3d))
            pt = np.add(pt, j*np.subtract(rotated_bl_3d, rotated_tl_3d))
            loc = np.floor(pt / RES)
            if (np.sum(loc >= 0) == 3 and loc[0] < int(LENGTH/RES) and
                loc[1] < int(WIDTH/RES) and loc[2] < int(HEIGHT/RES)):
                if loc.tolist() not in vbox_locs:
                    vbox_locs.append(loc.tolist())
    return vbox_locs

# pos_orient = [5,5,5,np.pi/2,np.pi/4,0]
# bbox = [150,200,450,600]
# print(get_voxels_at_distance(pos_orient, bbox, 3))


def update_voxel_value_list(vox_vals, new_voxes, value, objclass):
    for vox in new_voxes:
        key = str(int(vox[0])) + ',' + str(int(vox[1])) + ',' + str(int(vox[2]))
        if key in vox_vals:
            if value > vox_vals[key][0]:
                vox_vals[key] = [value, objclass]
        else:
            vox_vals[key] = [value, objclass]
    return vox_vals



def get_bbox_voxels(vox_vals):
    locs = []
    for vox_loc, val in vox_vals.items():
        loc = [int(v) for v in vox_loc.split(',')]
        locs.append(loc)
    return locs

def update_all_voxel_list(all_vox_list, vox_vals):
    new_voxels = get_bbox_voxels(vox_vals)
    for vox_loc in new_voxels:
        if vox_loc not in all_vox_list:
            all_vox_list.append(vox_loc)
    return all_vox_list


def update_no_bbox_voxels(in_bbox_voxels, all_voxels):
    for voxel in all_voxels:
        if voxel not in in_bbox_voxels:
            world.set_vortex_single(voxel, NUM_CLASSES, 0.8)
            # min_dist = np.sqrt(np.sum(np.square([LENGTH, WIDTH, HEIGHT])))
            # for in_voxel in in_bbox_voxels:
            #     min_dist = min(min_dist,
            #                    np.sqrt(np.sum(np.square([a - b for a, b in zip(in_voxel, voxel)]))))
            # value = RES * min_dist / EDGE_SHARPNESS
            # world.set_vortex_single(voxel, NUM_CLASSES, value)


def process_frame(class_bboxes, pos_orient, framecount):
    # class_bboxes is a list of lists, where each sublist is
    #   class, x1, y1, x2, y2, conf, dist
    # pos_orient is a 6 vector (x, y, z, thet, phi, delt)
    #   thet is from 0 to 2pi in x-y frame with respect to x-axis
    #   phi is from -pi/2 to pi/2 with respect to x-y plane
    #   delt is from 0 to 2pi which represents tilt of drone with respect to vref (xy plane)

    print('new frame ' + str(len(class_bboxes)) + ' bboxes')
    maxdist = np.sqrt(LENGTH**2 + WIDTH**2 + HEIGHT**2)
    maxsteps = int(maxdist / RES) + 1
    dists = list(range(1, maxsteps + 1))
    dists = [float(v) * RES for v in dists]

    print('getting all voxels')
    all_voxels = []
    for dist in dists:
        voxels_at_dist = get_voxels_at_distance(pos_orient, [0, 0, FRAME_WIDTH, FRAME_HEIGHT], dist)
        for voxel in voxels_at_dist:
            if voxel not in all_voxels:
                all_voxels.append([int(v) for v in voxel])
    world.update_visited(all_voxels)

    in_bbox_voxels = []
    for [object_class, x1, y1, x2, y2, conf, d] in class_bboxes:
        vox_vals = {}
        dists2 = [i for i in dists if i >= d]

        print('new bbox')
        print(object_class, x1, y1, x2, y2, conf)
        bbox = [max(0, x1), max(0, y1), min(FRAME_WIDTH, x2), min(FRAME_HEIGHT, y2)]
        for dist in dists2:
            voxels_at_dist = get_voxels_at_distance(pos_orient, bbox, dist)
            # print(dist, voxels_at_dist)
            value_at_dist = get_voxel_object_value(conf, dist)
            vox_vals = update_voxel_value_list(vox_vals, voxels_at_dist, value_at_dist, object_class)
        # print(vox_vals)
        in_bbox_voxels = update_all_voxel_list(in_bbox_voxels, vox_vals)
        print('updating bbox voxels')
        for vox_loc, val in vox_vals.items():
            loc = [int(v) for v in vox_loc.split(',')]
            world.set_vortex_single(loc, val[1], val[0])

    print('updating non-bbox voxels')
    # in_bbox_voxels = get_bbox_voxels(vox_vals)
    update_no_bbox_voxels(in_bbox_voxels, all_voxels)

    # world.display_visited()
    # world.display_unvisited()
    centers, posorients = world.get_posorients(5, 0)
    print(centers, posorients)
    # world.display_posorients(centers, posorients)
    # world.display_all()

    world.save_world(os.path.join(SAVEPATH, RUNNAME, str(framecount)))

    return True

# class_bboxes = [[0, [150,200,450,600], 0.8]]
# pos_orient = [5,5,5,np.pi/2,np.pi/4,0]
# process_frame(class_bboxes, pos_orient)
# class_bboxes = [[0, [100,200,450,600], 0.4]]
# pos_orient = [2,0,8,np.pi/3,0,0]
# process_frame(class_bboxes, pos_orient)
# class_bboxes = [[0, [200,300,400,500], 0.4]]
# pos_orient = [8,10,3,0,0,0]
# process_frame(class_bboxes, pos_orient)
# world.display_single(0)

def process_video(path):
    with open(path, 'r') as datafile:
        reader = csv.reader(datafile, delimiter=',')
        framecount = 0
        for row in reader:
            framecount += 1
            pos_orient = list(map(lambda x: float(x), row[:6]))
            pos_orient[0] += WIDTH * 0.5
            pos_orient[1] += LENGTH * 0.5
            pos_orient[2] += HEIGHT * 0.5
            num_objects = int((len(row) - 6)/7)
            class_bboxes = []
            for i in range(num_objects):
                objdata = row[6 + 7*i: 6 + 7*(i+1)]
                if objdata[0] != '':
                    objdata[0] = CLASSDICT[objdata[0]]
                    floatdata = list(map(lambda x: float(x), objdata))
                    class_bboxes.append(floatdata)
            class_bboxes = np.asarray(class_bboxes)
            class_bboxes[np.isnan(class_bboxes)] = 0
            # print(class_bboxes)
            process_frame(class_bboxes, pos_orient, framecount)

process_video(INPUTPATH)
world.display_visited()
world.display_unvisited()
world.display_all()
