; Auto-generated. Do not edit!


(cl:in-package slamdunk_msgs-msg)


;//! \htmlinclude ServiceTrigger.msg.html

(cl:defclass <ServiceTrigger> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ServiceTrigger (<ServiceTrigger>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ServiceTrigger>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ServiceTrigger)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slamdunk_msgs-msg:<ServiceTrigger> is deprecated: use slamdunk_msgs-msg:ServiceTrigger instead.")))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<ServiceTrigger>)))
    "Constants for message type '<ServiceTrigger>"
  '((:TRIGGER_MIN . 0)
    (:ON_DEMAND . 0)
    (:ALWAYS . 1)
    (:NEVER . 2)
    (:TRIGGER_MAX . 2))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'ServiceTrigger)))
    "Constants for message type 'ServiceTrigger"
  '((:TRIGGER_MIN . 0)
    (:ON_DEMAND . 0)
    (:ALWAYS . 1)
    (:NEVER . 2)
    (:TRIGGER_MAX . 2))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ServiceTrigger>) ostream)
  "Serializes a message object of type '<ServiceTrigger>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ServiceTrigger>) istream)
  "Deserializes a message object of type '<ServiceTrigger>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ServiceTrigger>)))
  "Returns string type for a message object of type '<ServiceTrigger>"
  "slamdunk_msgs/ServiceTrigger")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ServiceTrigger)))
  "Returns string type for a message object of type 'ServiceTrigger"
  "slamdunk_msgs/ServiceTrigger")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ServiceTrigger>)))
  "Returns md5sum for a message object of type '<ServiceTrigger>"
  "bac24ec0808c0471662183b689f61b6b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ServiceTrigger)))
  "Returns md5sum for a message object of type 'ServiceTrigger"
  "bac24ec0808c0471662183b689f61b6b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ServiceTrigger>)))
  "Returns full string definition for message of type '<ServiceTrigger>"
  (cl:format cl:nil "byte TRIGGER_MIN = 0~%~%# Automatically start the service when there are subscribers to its topic(s),~%# or when another service requires it.~%byte ON_DEMAND = 0~%~%# Always run the service.~%#~%# Note: the service may still not run if it depends on a disabled service.~%byte ALWAYS = 1~%~%# Never run the service,~%# even if some other service depends on it.~%byte NEVER = 2~%~%byte TRIGGER_MAX = 2~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ServiceTrigger)))
  "Returns full string definition for message of type 'ServiceTrigger"
  (cl:format cl:nil "byte TRIGGER_MIN = 0~%~%# Automatically start the service when there are subscribers to its topic(s),~%# or when another service requires it.~%byte ON_DEMAND = 0~%~%# Always run the service.~%#~%# Note: the service may still not run if it depends on a disabled service.~%byte ALWAYS = 1~%~%# Never run the service,~%# even if some other service depends on it.~%byte NEVER = 2~%~%byte TRIGGER_MAX = 2~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ServiceTrigger>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ServiceTrigger>))
  "Converts a ROS message object to a list"
  (cl:list 'ServiceTrigger
))
