
(cl:in-package :asdf)

(defsystem "slamdunk_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Save" :depends-on ("_package_Save"))
    (:file "_package_Save" :depends-on ("_package"))
  ))