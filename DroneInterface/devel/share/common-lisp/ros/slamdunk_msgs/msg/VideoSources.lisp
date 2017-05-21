; Auto-generated. Do not edit!


(cl:in-package slamdunk_msgs-msg)


;//! \htmlinclude VideoSources.msg.html

(cl:defclass <VideoSources> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass VideoSources (<VideoSources>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VideoSources>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VideoSources)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slamdunk_msgs-msg:<VideoSources> is deprecated: use slamdunk_msgs-msg:VideoSources instead.")))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<VideoSources>)))
    "Constants for message type '<VideoSources>"
  '((:SOURCE_MIN . 0)
    (:SOURCE_LIVE . 0)
    (:SOURCE_VDEC_SW . 1)
    (:SOURCE_VDEC_HW . 2)
    (:SOURCE_MAX . 2))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'VideoSources)))
    "Constants for message type 'VideoSources"
  '((:SOURCE_MIN . 0)
    (:SOURCE_LIVE . 0)
    (:SOURCE_VDEC_SW . 1)
    (:SOURCE_VDEC_HW . 2)
    (:SOURCE_MAX . 2))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VideoSources>) ostream)
  "Serializes a message object of type '<VideoSources>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VideoSources>) istream)
  "Deserializes a message object of type '<VideoSources>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VideoSources>)))
  "Returns string type for a message object of type '<VideoSources>"
  "slamdunk_msgs/VideoSources")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VideoSources)))
  "Returns string type for a message object of type 'VideoSources"
  "slamdunk_msgs/VideoSources")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VideoSources>)))
  "Returns md5sum for a message object of type '<VideoSources>"
  "47761778812ba2726a391fe9c5ce06c1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VideoSources)))
  "Returns md5sum for a message object of type 'VideoSources"
  "47761778812ba2726a391fe9c5ce06c1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VideoSources>)))
  "Returns full string definition for message of type '<VideoSources>"
  (cl:format cl:nil "# available video Sources~%~%byte SOURCE_MIN = 0~%~%byte SOURCE_LIVE = 0~%byte SOURCE_VDEC_SW = 1~%byte SOURCE_VDEC_HW = 2~%~%byte SOURCE_MAX = 2~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VideoSources)))
  "Returns full string definition for message of type 'VideoSources"
  (cl:format cl:nil "# available video Sources~%~%byte SOURCE_MIN = 0~%~%byte SOURCE_LIVE = 0~%byte SOURCE_VDEC_SW = 1~%byte SOURCE_VDEC_HW = 2~%~%byte SOURCE_MAX = 2~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VideoSources>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VideoSources>))
  "Converts a ROS message object to a list"
  (cl:list 'VideoSources
))
