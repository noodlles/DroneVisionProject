; Auto-generated. Do not edit!


(cl:in-package slamdunk_msgs-msg)


;//! \htmlinclude VideoModes.msg.html

(cl:defclass <VideoModes> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass VideoModes (<VideoModes>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VideoModes>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VideoModes)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slamdunk_msgs-msg:<VideoModes> is deprecated: use slamdunk_msgs-msg:VideoModes instead.")))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<VideoModes>)))
    "Constants for message type '<VideoModes>"
  '((:MODE_MIN . 0)
    (:MODE_AUTO . 0)
    (:MODE_1280_960_30 . 1)
    (:MODE_1500_1500_30 . 2)
    (:MODE_1500_1500_60 . 3)
    (:MODE_900_700_120 . 4)
    (:MODE_MAX . 4))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'VideoModes)))
    "Constants for message type 'VideoModes"
  '((:MODE_MIN . 0)
    (:MODE_AUTO . 0)
    (:MODE_1280_960_30 . 1)
    (:MODE_1500_1500_30 . 2)
    (:MODE_1500_1500_60 . 3)
    (:MODE_900_700_120 . 4)
    (:MODE_MAX . 4))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VideoModes>) ostream)
  "Serializes a message object of type '<VideoModes>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VideoModes>) istream)
  "Deserializes a message object of type '<VideoModes>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VideoModes>)))
  "Returns string type for a message object of type '<VideoModes>"
  "slamdunk_msgs/VideoModes")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VideoModes)))
  "Returns string type for a message object of type 'VideoModes"
  "slamdunk_msgs/VideoModes")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VideoModes>)))
  "Returns md5sum for a message object of type '<VideoModes>"
  "0147adab7f1658b199e20466209de625")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VideoModes)))
  "Returns md5sum for a message object of type 'VideoModes"
  "0147adab7f1658b199e20466209de625")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VideoModes>)))
  "Returns full string definition for message of type '<VideoModes>"
  (cl:format cl:nil "# available video modes~%~%byte MODE_MIN = 0~%~%byte MODE_AUTO = 0~%byte MODE_1280_960_30 = 1~%byte MODE_1500_1500_30 = 2~%byte MODE_1500_1500_60 = 3~%byte MODE_900_700_120 = 4~%~%byte MODE_MAX = 4~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VideoModes)))
  "Returns full string definition for message of type 'VideoModes"
  (cl:format cl:nil "# available video modes~%~%byte MODE_MIN = 0~%~%byte MODE_AUTO = 0~%byte MODE_1280_960_30 = 1~%byte MODE_1500_1500_30 = 2~%byte MODE_1500_1500_60 = 3~%byte MODE_900_700_120 = 4~%~%byte MODE_MAX = 4~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VideoModes>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VideoModes>))
  "Converts a ROS message object to a list"
  (cl:list 'VideoModes
))
