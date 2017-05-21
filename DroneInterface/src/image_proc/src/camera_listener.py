#!/usr/bin/env python
import rospy
import numpy as np
import sys
sys.path.insert(0, '/home/me132/DroneVisionProject/frcnn/')
from cv_bridge import CvBridge, CvBridgeError
from sensor_msgs.msg import Image

from test_frcnn3 import predict

bridge = CvBridge()

def callback(data):
    rospy.loginfo(rospy.get_caller_id() + " Image Found")
    try:
        cv_image = bridge.imgmsg_to_cv2(data, "bgr8")
    except CvBridgeError as e:
        print(e)
    im, bbxs = predict(cv_image)
    print bbxs

def listener():

    rospy.init_node('listener', anonymous=True)

    rospy.Subscriber("left_rgb/image", Image, callback)

    rospy.spin()

if __name__ == '__main__':
    listener()
