import numpy as np
import sys
sys.path.insert(0, '/home/me132/DroneVisionProject/frcnn/')
from cv_bridge import CvBridge, CvBridgeError
from sensor_msgs.msg import Image
from geometry_msgs.msg import PoseStamped
from test_frcnn3 import predict
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

    def update(self, im, pose, depth):
      #  try:
        cv_image = bridge.imgmsg_to_cv2(im, "rgb8")
        assert(cv_image.shape == (480, 640, 3))
        self.im = cv_image

        xyzrpy = parsepose(pose)
        self.pose = xyzrpy
        
        print depth


        self.empty = False
        #except Exception as e:
         #   print "UPDATE FAILED ", e

    def getall():
        return predict(self.im), self.depth, self.pose
        

    

        
        
        

