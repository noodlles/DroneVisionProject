; Auto-generated. Do not edit!


(cl:in-package slamdunk_msgs-msg)


;//! \htmlinclude StreamingTypes.msg.html

(cl:defclass <StreamingTypes> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass StreamingTypes (<StreamingTypes>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StreamingTypes>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StreamingTypes)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slamdunk_msgs-msg:<StreamingTypes> is deprecated: use slamdunk_msgs-msg:StreamingTypes instead.")))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<StreamingTypes>)))
    "Constants for message type '<StreamingTypes>"
  '((:TYPE_MIN . 0)
    (:TYPE_RTP . 0)
    (:TYPE_FILE . 1)
    (:TYPE_MAX . 1))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'StreamingTypes)))
    "Constants for message type 'StreamingTypes"
  '((:TYPE_MIN . 0)
    (:TYPE_RTP . 0)
    (:TYPE_FILE . 1)
    (:TYPE_MAX . 1))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StreamingTypes>) ostream)
  "Serializes a message object of type '<StreamingTypes>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StreamingTypes>) istream)
  "Deserializes a message object of type '<StreamingTypes>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StreamingTypes>)))
  "Returns string type for a message object of type '<StreamingTypes>"
  "slamdunk_msgs/StreamingTypes")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StreamingTypes)))
  "Returns string type for a message object of type 'StreamingTypes"
  "slamdunk_msgs/StreamingTypes")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StreamingTypes>)))
  "Returns md5sum for a message object of type '<StreamingTypes>"
  "d8538d0b43c315fff9cbb5e3d634bc8c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StreamingTypes)))
  "Returns md5sum for a message object of type 'StreamingTypes"
  "d8538d0b43c315fff9cbb5e3d634bc8c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StreamingTypes>)))
  "Returns full string definition for message of type '<StreamingTypes>"
  (cl:format cl:nil "# available streaming types~%~%byte TYPE_MIN = 0~%~%byte TYPE_RTP = 0~%byte TYPE_FILE = 1~%~%byte TYPE_MAX = 1~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StreamingTypes)))
  "Returns full string definition for message of type 'StreamingTypes"
  (cl:format cl:nil "# available streaming types~%~%byte TYPE_MIN = 0~%~%byte TYPE_RTP = 0~%byte TYPE_FILE = 1~%~%byte TYPE_MAX = 1~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StreamingTypes>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StreamingTypes>))
  "Converts a ROS message object to a list"
  (cl:list 'StreamingTypes
))
