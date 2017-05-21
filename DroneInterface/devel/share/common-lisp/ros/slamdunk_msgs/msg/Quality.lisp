; Auto-generated. Do not edit!


(cl:in-package slamdunk_msgs-msg)


;//! \htmlinclude Quality.msg.html

(cl:defclass <Quality> (roslisp-msg-protocol:ros-message)
  ((value
    :reader value
    :initarg :value
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Quality (<Quality>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Quality>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Quality)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slamdunk_msgs-msg:<Quality> is deprecated: use slamdunk_msgs-msg:Quality instead.")))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <Quality>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slamdunk_msgs-msg:value-val is deprecated.  Use slamdunk_msgs-msg:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<Quality>)))
    "Constants for message type '<Quality>"
  '((:UNKNOWN . 0)
    (:GOOD . 1)
    (:HAZARDOUS . 2)
    (:BAD . 3)
    (:LOST . 4))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'Quality)))
    "Constants for message type 'Quality"
  '((:UNKNOWN . 0)
    (:GOOD . 1)
    (:HAZARDOUS . 2)
    (:BAD . 3)
    (:LOST . 4))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Quality>) ostream)
  "Serializes a message object of type '<Quality>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'value)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Quality>) istream)
  "Deserializes a message object of type '<Quality>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'value)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Quality>)))
  "Returns string type for a message object of type '<Quality>"
  "slamdunk_msgs/Quality")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Quality)))
  "Returns string type for a message object of type 'Quality"
  "slamdunk_msgs/Quality")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Quality>)))
  "Returns md5sum for a message object of type '<Quality>"
  "4021ec07717d2e06601ff253a61981b1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Quality)))
  "Returns md5sum for a message object of type 'Quality"
  "4021ec07717d2e06601ff253a61981b1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Quality>)))
  "Returns full string definition for message of type '<Quality>"
  (cl:format cl:nil "uint8 value~%uint8 UNKNOWN = 0~%uint8 GOOD = 1~%uint8 HAZARDOUS = 2~%uint8 BAD = 3~%uint8 LOST = 4~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Quality)))
  "Returns full string definition for message of type 'Quality"
  (cl:format cl:nil "uint8 value~%uint8 UNKNOWN = 0~%uint8 GOOD = 1~%uint8 HAZARDOUS = 2~%uint8 BAD = 3~%uint8 LOST = 4~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Quality>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Quality>))
  "Converts a ROS message object to a list"
  (cl:list 'Quality
    (cl:cons ':value (value msg))
))
