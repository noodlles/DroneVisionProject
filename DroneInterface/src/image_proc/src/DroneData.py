import numpy as np
import sys
sys.path.insert(0, '/home/me132/DroneVisionProject/frcnn/')
from cv_bridge import CvBridge, CvBridgeError
from sensor_msgs.msg import Image
from geometry_msgs.msg import PoseStamped
from test_frcnn3 import predict
from scipy.misc import imresize
from scipy.ndimage.filters import median_filter
import cv2
from scipy.misc import imresize

bridge = CvBridge()

def parsepose(ps):
    pos = ps.pose.position
    q = ps.pose.orientation

    ysqr = q.y * q.y
    t0 = 2.0 * (q.w * q.x + q.y * q.z)
    t1 = 1.0 - 2.0 * (q.x * q.x + ysqr)
    roll = np.arctan2(t0, t1)

    t2 = 2.0 * (q.w * q.y - q.z * q.x)
    t2 = min(t2, 1.0)
    t2 = max(t2, -1.0)
    pitch = np.arcsin(t2)

    t3 = 2.0 * (q.w * q.z + q.x * q.y)
    t4 = 1.0 - 2.0 * (ysqr + q.z * q.z)
    yaw = np.arctan2(t3, t4)

    return np.array([pos.x, pos.y, pos.z, roll, pitch, yaw])



class DroneData():
    def __init__(self):
        self.empty = True
        self.im = None
        self.depth = None
        self.pose = None
        self.count = 0

    def update(self, im, pose, depth):
        try:
            cv_image = bridge.imgmsg_to_cv2(im, "rgb8")
            assert(cv_image.shape == (480, 640, 3))
            self.im = cv_image
            cv2.imwrite("im"+str(self.count)+".png", cv_image)
            self.count += 1

            xyzrpy = parsepose(pose)
            self.pose = xyzrpy

            cv_image = bridge.imgmsg_to_cv2(depth, "passthrough")
            cv_image = np.nan_to_num(cv_image)
            cv_image = np.clip(cv_image, 0, 100)
            cv_image = imresize(cv_image, (600, 800), "nearest") / 2.55
            cv_image = median_filter(cv_image, 7)
            cv_image[cv_image == 0] = np.nan
            self.depth = cv_image

            self.empty = False
        except Exception as e:
            print "UPDATE FAILED ", e

    def getall(self):
        preds = predict(self.im)
        results = []
        for pred in preds:
            res = pred
            res.append(np.nanmean(self.depth[pred[1]:pred[3] , pred[2]:pred[4]]))
            results.append(res)

        return results, self.pose
