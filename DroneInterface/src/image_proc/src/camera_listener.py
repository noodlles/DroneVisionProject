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


from test_frcnn3 import predict
dd = DroneData()
bridge = CvBridge()

def callbacksynch(image, pose, depth):
    dd.update(image, pose, depth)
    print "A"
    

    

def callbackim(image):
    print type(image)
    rospy.loginfo(rospy.get_caller_id() + " Image Found")

def callbackpose(pose):
    print type(pose)
    rospy.loginfo(rospy.get_caller_id() + " Pose Found")

def callbackdepth(depth):
    #print depth
    print depth.height
    print depth.width
    print type(depth.data)
    print len(depth.data)
    print depth.encoding
    cv_image = bridge.imgmsg_to_cv2(depth, "32FC1")
    print cv_image.shape
    print cv_image[0,3]

    rospy.loginfo(rospy.get_caller_id() + " Depth Found")

def listener():

    rospy.init_node('listener', anonymous=True)

    #rospy.Subscriber("left_rgb/image", Image, callbackim)
    #rospy.Subscriber("pose", PoseStamped, callbackpose)
    rospy.Subscriber("depth_map/image", Image, callbackdepth)

    #left_im = message_filters.Subscriber("left_rgb/image", Image)
    #slam_pose = message_filters.Subscriber("pose", PoseStamped)
    #depth = message_filters.Subscriber("depth_map/points_wxyzrgb", PointCloud2)

    

    #ts = message_filters.TimeSynchronizer([left_im, slam_pose, depth], 500)
    #ts.registerCallback(callbacksynch)

    rospy.spin()

if __name__ == '__main__':
    listener()
