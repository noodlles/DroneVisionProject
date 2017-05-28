#!/usr/bin/env python
import rospy
import numpy as np
import sys
sys.path.insert(0, '/home/me132/DroneVisionProject/frcnn/')
from cv_bridge import CvBridge, CvBridgeError
from sensor_msgs.msg import Image, PointCloud2
from geometry_msgs.msg import PoseStamped
import message_filters
from DroneData import DroneData
import time
from scipy.misc import imresize
from scipy.ndimage.filters import median_filter
import matplotlib.pyplot as plt


from test_frcnn3 import predict
dd = DroneData()
bridge = CvBridge()

def callbacksynch(image, pose, depth):
    dd.update(image, pose, depth)
    response = dd.getall()
    print response
    

    

def callbackim(image):
    print type(image)
    rospy.loginfo(rospy.get_caller_id() + " Image Found")

def callbackpose(pose):
    print type(pose)
    rospy.loginfo(rospy.get_caller_id() + " Pose Found")

def callbackdepth(depth):
    cv_image = bridge.imgmsg_to_cv2(depth, "passthrough")
    cv_image = np.nan_to_num(cv_image)
    cv_image = np.clip(cv_image, 0, 100)
    cv_image = imresize(cv_image, (600, 800), "nearest") / 2.55
    cv_image = median_filter(cv_image, 7)

    

    rospy.loginfo(rospy.get_caller_id() + " Depth Found")

def listener():

    rospy.init_node('listener', anonymous=True)

    #rospy.Subscriber("left_rgb/image", Image, callbackim)
    #rospy.Subscriber("pose", PoseStamped, callbackpose)
    #rospy.Subscriber("depth_map/image", Image, callbackdepth)

    left_im = message_filters.Subscriber("left_rgb/image", Image)
    slam_pose = message_filters.Subscriber("pose", PoseStamped)
    depth = message_filters.Subscriber("depth_map/image", Image)

    

    ts = message_filters.TimeSynchronizer([left_im, slam_pose, depth], 500)
    ts.registerCallback(callbacksynch)

    rospy.spin()

if __name__ == '__main__':
    listener()
