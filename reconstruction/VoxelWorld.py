import numpy as np
from vispy import app, visuals, scene

class VoxelWorld():

    def __init__(self, l, w, h, num_objects):
        self.world = np.zeros(shape=(l, w, h, num_objects + 1))
        self.length = l
        self.width = w
        self.height = h
        self.numpoints = l * w * h

    def get_vortex_all(self, loc):
        return self.world[loc[0]][loc[1]][loc[2]]

    def get_vortex_single(self, loc, object_idx):
        return self.world[loc[0]][loc[1]][loc[2]][object_idx]

    def set_vortex_single(self, loc, object_idx, value):
         self.world[loc[0]][loc[1]][loc[2]][object_idx] += value

    def save_world(self, path):
        np.savetxt(path, self.world)

    def display_single(self, object_idx):
        # TODO(anshul) generate 3D world visualization

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
