; Auto-generated. Do not edit!


(cl:in-package slamdunk_msgs-msg)


;//! \htmlinclude ReconfigureLevels.msg.html

(cl:defclass <ReconfigureLevels> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ReconfigureLevels (<ReconfigureLevels>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ReconfigureLevels>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ReconfigureLevels)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slamdunk_msgs-msg:<ReconfigureLevels> is deprecated: use slamdunk_msgs-msg:ReconfigureLevels instead.")))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<ReconfigureLevels>)))
    "Constants for message type '<ReconfigureLevels>"
  '((:NODE . 1)
    (:STREAMING . 2)
    (:VIDEO_MODE . 4)
    (:VIDEO_SOURCE . 8)
    (:SERVICE_TRIGGER . 16))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'ReconfigureLevels)))
    "Constants for message type 'ReconfigureLevels"
  '((:NODE . 1)
    (:STREAMING . 2)
    (:VIDEO_MODE . 4)
    (:VIDEO_SOURCE . 8)
    (:SERVICE_TRIGGER . 16))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ReconfigureLevels>) ostream)
  "Serializes a message object of type '<ReconfigureLevels>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ReconfigureLevels>) istream)
  "Deserializes a message object of type '<ReconfigureLevels>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ReconfigureLevels>)))
  "Returns string type for a message object of type '<ReconfigureLevels>"
  "slamdunk_msgs/ReconfigureLevels")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReconfigureLevels)))
  "Returns string type for a message object of type 'ReconfigureLevels"
  "slamdunk_msgs/ReconfigureLevels")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ReconfigureLevels>)))
  "Returns md5sum for a message object of type '<ReconfigureLevels>"
  "abb7323d211b806e7835ae01d4f75714")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ReconfigureLevels)))
  "Returns md5sum for a message object of type 'ReconfigureLevels"
  "abb7323d211b806e7835ae01d4f75714")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ReconfigureLevels>)))
  "Returns full string definition for message of type '<ReconfigureLevels>"
  (cl:format cl:nil "# Only local to the node code, no need to forward anything to kalamos context~%byte NODE = 1~%~%# Streaming options, should reconfigure kalamos context~%byte STREAMING = 2~%~%# General options, should reconfigure kalamos context~%byte VIDEO_MODE = 4~%~%# General options, should reconfigure kalamos context~%byte VIDEO_SOURCE = 8~%~%byte SERVICE_TRIGGER = 16~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ReconfigureLevels)))
  "Returns full string definition for message of type 'ReconfigureLevels"
  (cl:format cl:nil "# Only local to the node code, no need to forward anything to kalamos context~%byte NODE = 1~%~%# Streaming options, should reconfigure kalamos context~%byte STREAMING = 2~%~%# General options, should reconfigure kalamos context~%byte VIDEO_MODE = 4~%~%# General options, should reconfigure kalamos context~%byte VIDEO_SOURCE = 8~%~%byte SERVICE_TRIGGER = 16~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ReconfigureLevels>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ReconfigureLevels>))
  "Converts a ROS message object to a list"
  (cl:list 'ReconfigureLevels
))
