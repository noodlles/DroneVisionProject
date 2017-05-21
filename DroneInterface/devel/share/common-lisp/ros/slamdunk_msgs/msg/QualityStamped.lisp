; Auto-generated. Do not edit!


(cl:in-package slamdunk_msgs-msg)


;//! \htmlinclude QualityStamped.msg.html

(cl:defclass <QualityStamped> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (quality
    :reader quality
    :initarg :quality
    :type slamdunk_msgs-msg:Quality
    :initform (cl:make-instance 'slamdunk_msgs-msg:Quality)))
)

(cl:defclass QualityStamped (<QualityStamped>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <QualityStamped>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'QualityStamped)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slamdunk_msgs-msg:<QualityStamped> is deprecated: use slamdunk_msgs-msg:QualityStamped instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <QualityStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slamdunk_msgs-msg:header-val is deprecated.  Use slamdunk_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'quality-val :lambda-list '(m))
(cl:defmethod quality-val ((m <QualityStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slamdunk_msgs-msg:quality-val is deprecated.  Use slamdunk_msgs-msg:quality instead.")
  (quality m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <QualityStamped>) ostream)
  "Serializes a message object of type '<QualityStamped>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'quality) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <QualityStamped>) istream)
  "Deserializes a message object of type '<QualityStamped>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'quality) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<QualityStamped>)))
  "Returns string type for a message object of type '<QualityStamped>"
  "slamdunk_msgs/QualityStamped")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'QualityStamped)))
  "Returns string type for a message object of type 'QualityStamped"
  "slamdunk_msgs/QualityStamped")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<QualityStamped>)))
  "Returns md5sum for a message object of type '<QualityStamped>"
  "b6e6186f383d46e394043a8f436f9ca8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'QualityStamped)))
  "Returns md5sum for a message object of type 'QualityStamped"
  "b6e6186f383d46e394043a8f436f9ca8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<QualityStamped>)))
  "Returns full string definition for message of type '<QualityStamped>"
  (cl:format cl:nil "Header header~%Quality quality~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: slamdunk_msgs/Quality~%uint8 value~%uint8 UNKNOWN = 0~%uint8 GOOD = 1~%uint8 HAZARDOUS = 2~%uint8 BAD = 3~%uint8 LOST = 4~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'QualityStamped)))
  "Returns full string definition for message of type 'QualityStamped"
  (cl:format cl:nil "Header header~%Quality quality~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: slamdunk_msgs/Quality~%uint8 value~%uint8 UNKNOWN = 0~%uint8 GOOD = 1~%uint8 HAZARDOUS = 2~%uint8 BAD = 3~%uint8 LOST = 4~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <QualityStamped>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'quality))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <QualityStamped>))
  "Converts a ROS message object to a list"
  (cl:list 'QualityStamped
    (cl:cons ':header (header msg))
    (cl:cons ':quality (quality msg))
))
