
(cl:in-package :asdf)

(defsystem "slamdunk_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "ServiceTrigger" :depends-on ("_package_ServiceTrigger"))
    (:file "_package_ServiceTrigger" :depends-on ("_package"))
    (:file "VideoModes" :depends-on ("_package_VideoModes"))
    (:file "_package_VideoModes" :depends-on ("_package"))
    (:file "Quality" :depends-on ("_package_Quality"))
    (:file "_package_Quality" :depends-on ("_package"))
    (:file "StreamingTypes" :depends-on ("_package_StreamingTypes"))
    (:file "_package_StreamingTypes" :depends-on ("_package"))
    (:file "ReconfigureLevels" :depends-on ("_package_ReconfigureLevels"))
    (:file "_package_ReconfigureLevels" :depends-on ("_package"))
    (:file "BoolStamped" :depends-on ("_package_BoolStamped"))
    (:file "_package_BoolStamped" :depends-on ("_package"))
    (:file "QualityStamped" :depends-on ("_package_QualityStamped"))
    (:file "_package_QualityStamped" :depends-on ("_package"))
    (:file "VideoSources" :depends-on ("_package_VideoSources"))
    (:file "_package_VideoSources" :depends-on ("_package"))
  ))