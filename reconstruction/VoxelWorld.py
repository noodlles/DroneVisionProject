import numpy as np
from vispy import app, visuals, scene
from sklearn.cluster import KMeans

COLORDICT = {
    '0' : [1.0, 0.0, 0.0],
    '1' : [0.0, 1.0, 0.0],
    '2' : [0.0, 0.0, 1.0],
    '3' : [1.0, 1.0, 0.0],
    '4' : [1.0, 0.0, 1.0],
    '5' : [0.0, 1.0, 1.0],
    '6' : [0.3, 0.3, 0.6],
    '7' : [0.6, 0.2, 0.2],
}


class VoxelWorld():

    def __init__(self, l, w, h, num_objects):
        self.world = np.zeros(shape=(l, w, h, num_objects + 1))
        self.visited = np.zeros(shape=(l, w, h))
        self.length = l
        self.width = w
        self.height = h
        self.numpoints = l * w * h
        self.num_objects = num_objects

    def get_vortex_all(self, loc):
        return self.world[loc[0]][loc[1]][loc[2]]

    def get_vortex_single(self, loc, object_idx):
        return self.world[loc[0]][loc[1]][loc[2]][int(object_idx)]

    def set_vortex_single(self, loc, object_idx, value):
         self.world[loc[0]][loc[1]][loc[2]][int(object_idx)] += value

    def update_visited(self, voxels):
        for [i, j, k] in voxels:
            self.visited[i][j][k] += 1

    def get_posorients(self, num_points, thresh):
        data = self.visited
        unvisited = []
        for i in range(self.length):
            for j in range(self.width):
                for k in range(self.height):
                    if data[i][j][k] <= thresh:
                        unvisited.append([i, j, k])
        unvisited = np.asarray(unvisited)
        kmeans = KMeans(n_clusters=num_points, random_state=0).fit(unvisited)
        labels = kmeans.labels_
        centers = kmeans.cluster_centers_
        posorients = []
        for i in range(num_points):
            pts_for_center = []
            euc_dists = []
            lin_dists = []
            for j in range(len(labels)):
                if labels[j] == i:
                    pt = unvisited[j]
                    if np.absolute(pt[2] - centers[i][2]) < 5:
                        pts_for_center.append(unvisited[j])
                        euc_dists.append(np.sqrt(np.sum(np.square([a - b for a, b in zip(centers[i], unvisited[j])]))))
                        lin_dists.append(np.sum(np.absolute([a - b for a, b in zip(centers[i], unvisited[j])])))
            max_dist = max(euc_dists)
            pt_to_use = []
            pt_to_use_dist = 0
            for j in range(len(pts_for_center)):
                if (euc_dists[j] > 0.8 * max_dist and
                    euc_dists[j] < 0.9 * max_dist and
                    lin_dists[j] > pt_to_use_dist and
                    np.absolute(pts_for_center[j][2] - centers[i][2]) < 5):
                    pt_to_use = pts_for_center[j]
                    pt_to_use_dist = lin_dists[j]
            if pt_to_use != []:
                theta = np.arctan2(centers[i][1] - pt_to_use[1], centers[i][0] - pt_to_use[0])
                val = np.sqrt(np.sum(np.square([centers[i][0] - pt_to_use[0], centers[i][1] - pt_to_use[1]])))
                phi = np.arctan2(centers[i][2] - pt_to_use[2], val)
                delta = 0.0
                posorients.append([pt_to_use[0], pt_to_use[1], pt_to_use[2], phi, delta, theta])
            else:
                posorients.append([])
        return centers, posorients


    def save_world(self, path):
        visited_to_save = np.expand_dims(self.visited, axis=3)
        all_data = np.concatenate((self.world, visited_to_save), axis=3)
        np.save(path, all_data)

    def load_world(self, path):
        all_data = np.load(path)
        self.world = all_data[:,:,:,:num_objects+1]
        self.visited = all_data[:,:,:,num_objects+1]

    def display_visited(self):
        # build your visuals
        Scatter3D = scene.visuals.create_visual_node(visuals.MarkersVisual)

        # The real-things : plot using scene
        # build canvas
        canvas = scene.SceneCanvas(keys='interactive', show=True)

        # Add a ViewBox to let the user zoom/rotate
        view = canvas.central_widget.add_view()
        view.camera = 'turntable'
        view.camera.fov = 45
        view.camera.distance = 500

        data = self.visited
        maxvalue = np.nanmax(data)

        # data
        pos = []
        colors = []
        for i in range(self.length):
            for j in range(self.width):
                for k in range(self.height):
                    if data[i][j][k] > 0.0:
                        pos.append((i, j, k))
                        colors.append((1.0, 0.0, 0.0, data[i][j][k] / maxvalue))
                    # else:
                    #     pos.append((i, j, k))
                    #     colors.append((0, 0, 0, 0.01))
        pos = np.asarray(pos)
        colors = np.asarray(colors)

        # plot
        p1 = Scatter3D(parent=view.scene)
        p1.set_gl_state('translucent', blend=True, depth_test=True)
        p1.set_data(pos, face_color=colors)
        p1.symbol = visuals.marker_types[10]

        # run
        app.run()

        # return 0

    def display_posorients(self, centers, posorients):
        # build your visuals
        Scatter3D = scene.visuals.create_visual_node(visuals.MarkersVisual)

        # The real-things : plot using scene
        # build canvas
        canvas = scene.SceneCanvas(keys='interactive', show=True)

        # Add a ViewBox to let the user zoom/rotate
        view = canvas.central_widget.add_view()
        view.camera = 'turntable'
        view.camera.fov = 45
        view.camera.distance = 500

        data = self.visited

        center_pts = []
        for [x, y, z] in centers:
            center_pts.append([np.floor(x), np.floor(y), np.floor(z)])

        drone_pts = []
        for [x, y, z, p, d, t] in posorients:
            drone_pts.append([np.floor(x), np.floor(y), np.floor(z)])

        # data
        pos = []
        colors = []

        for i in range(len(center_pts)):
            cpt = center_pts[i]
            dpt = drone_pts[i]
            pos.append(cpt)
            colors.append((1.0, 0.0, 0.0, 1.0))
            if dpt != []:
                pos.append(dpt)
                colors.append((0.0, 1.0, 0.0, 1.0))
                for j in np.linspace(0, 1, 20)[1:-1]:
                    pos.append([j*a + (1-j)*b for a,b in zip(cpt, dpt)])
                    colors.append((0.0, 0.0, 1.0, 1.0))

        for i in range(self.length):
            for j in range(self.width):
                for k in range(self.height):
                    if data[i][j][k] > 0:
                        pos.append((i, j, k))
                        colors.append((0.0, 0.0, 0.0, 0.2))

        pos = np.asarray(pos)
        colors = np.asarray(colors)

        # plot
        p1 = Scatter3D(parent=view.scene)
        p1.set_gl_state('translucent', blend=True, depth_test=True)
        p1.set_data(pos, face_color=colors)
        p1.symbol = visuals.marker_types[10]

        # run
        app.run()

        # return 0

    def display_unvisited(self):
        # build your visuals
        Scatter3D = scene.visuals.create_visual_node(visuals.MarkersVisual)

        # The real-things : plot using scene
        # build canvas
        canvas = scene.SceneCanvas(keys='interactive', show=True)

        # Add a ViewBox to let the user zoom/rotate
        view = canvas.central_widget.add_view()
        view.camera = 'turntable'
        view.camera.fov = 45
        view.camera.distance = 500

        data = self.visited

        # data
        pos = []
        colors = []
        for i in range(self.length):
            for j in range(self.width):
                for k in range(self.height):
                    if data[i][j][k] == 0:
                        pos.append((i, j, k))
                        colors.append((1.0, 0.0, 0.0, 0.2))

                    # else:
                    #     pos.append((i, j, k))
                    #     colors.append((0, 0, 0, 0.01))



        pos = np.asarray(pos)
        colors = np.asarray(colors)

        # plot
        p1 = Scatter3D(parent=view.scene)
        p1.set_gl_state('translucent', blend=True, depth_test=True)
        p1.set_data(pos, face_color=colors)
        p1.symbol = visuals.marker_types[10]

        # run
        app.run()

        # return 0

    def display_single(self, object_idx):
        # build your visuals
        Scatter3D = scene.visuals.create_visual_node(visuals.MarkersVisual)

        # The real-things : plot using scene
        # build canvas
        canvas = scene.SceneCanvas(keys='interactive', show=True)

        # Add a ViewBox to let the user zoom/rotate
        view = canvas.central_widget.add_view()
        view.camera = 'turntable'
        view.camera.fov = 45
        view.camera.distance = 500

        data = self.world[:,:,:,object_idx]
        maxvalue = np.nanmax(data)

        # data
        pos = []
        colors = []
        for i in range(self.length):
            for j in range(self.width):
                for k in range(self.height):
                    if data[i][j][k] > 0.0:
                        pos.append((i, j, k))
                        colors.append((data[i][j][k] / maxvalue, 0, 0, 0.8))
                    # else:
                    #     pos.append((i, j, k))
                    #     colors.append((0, 0, 0, 0.01))
        pos = np.asarray(pos)
        colors = np.asarray(colors)

        # plot
        p1 = Scatter3D(parent=view.scene)
        p1.set_gl_state('translucent', blend=True, depth_test=True)
        p1.set_data(pos, face_color=colors)
        p1.symbol = visuals.marker_types[10]

        # run
        app.run()

        # return 0

    def display_all(self):

        # build your visuals
        Scatter3D = scene.visuals.create_visual_node(visuals.MarkersVisual)

        # The real-things : plot using scene
        # build canvas
        canvas = scene.SceneCanvas(keys='interactive', show=True)

        # Add a ViewBox to let the user zoom/rotate
        view = canvas.central_widget.add_view()
        view.camera = 'turntable'
        view.camera.fov = 45
        view.camera.distance = 500

        # data = self.world[:,:,:,object_idx]
        maxvalues = []
        for i in range(self.num_objects):
            data = self.world[:,:,:,i]
            maxvalue = np.nanmax(data)
            maxvalues.append(maxvalue)
        mv = np.nanmax(self.world)
        maxvalues = np.ones(self.num_objects) * mv
        # data
        pos = []
        colors = []
        for i in range(self.length):
            for j in range(self.width):
                for k in range(self.height):
                    data = self.world[i][j][k]
                    maxclass = np.argmax(data)
                    if data[maxclass] > 0.0 and maxclass != self.num_objects:
                        pos.append((i, j, k))
                        basecolor = COLORDICT[str(maxclass)]
                        colors.append((basecolor[0], basecolor[1], basecolor[2], data[maxclass] / maxvalues[maxclass]))
                    # else:
                    #     pos.append((i, j, k))
                    #     colors.append((0, 0, 0, 0.01))
        pos = np.asarray(pos)
        colors = np.asarray(colors)

        # plot
        p1 = Scatter3D(parent=view.scene)
        p1.set_gl_state('translucent', blend=True, depth_test=True)
        p1.set_data(pos, face_color=colors)
        p1.symbol = visuals.marker_types[10]

        # run
        app.run()

        # return 0
