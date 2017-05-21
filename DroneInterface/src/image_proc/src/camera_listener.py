#!/usr/bin/env python
import rospy
import numpy as np
from cv_bridge import CvBridge, CvBridgeError
from sensor_msgs.msg import Image

bridge = CvBridge()

def callback(data):
    print "LMAO"
    try:
        cv_image = bridge.imgmsg_to_cv2(data, "bgr8")
    except CvBridgeError as e:
        print(e)
    print type(cv_image)
    im = np.array(cv_image)
    print im.shape
    rospy.loginfo(rospy.get_caller_id() + " I gots image")

def listener():

    rospy.init_node('listener', anonymous=True)

    rospy.Subscriber("left_rgb/image", Image, callback)

    rospy.spin()

if __name__ == '__main__':
    listener()
