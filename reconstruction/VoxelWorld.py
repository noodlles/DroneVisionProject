import numpy as np

class VoxelWorld():

    def __init__(self, l, w, h, num_objects):
        self.world = np.zeros(shape=(l, w, h, num_objects + 1))

    def get_vortex_all(self, loc):
        return self.world[loc[0]][loc[1]][loc[2]]

    def get_vortex_single(self, loc, object_idx):
        return self.world[loc[0]][loc[1]][loc[2]][object_idx]

    def set_vortex_single(self, loc, object_idx, value):
         self.world[loc[0]][loc[1]][loc[2]][object_idx] += value

    def display_single(self, object_idx):
        # TODO(anshul) generate 3D world visualization
        return 0
