#!/usr/bin/env python
import rospy
import image_transport
from sensor_msgs.msg import Image

def callback(data):
    rospy.loginfo(rospy.get_caller_id() + "I gots image")

def listener():

    rospy.init_node('listener', anonymous=True)

    image_transport.SubscriberFilter("left_rgb/image", Image, callback)

    rospy.spin()

if __name__ == '__main__':
    listener()
