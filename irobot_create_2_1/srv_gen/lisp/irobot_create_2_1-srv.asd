
(cl:in-package :asdf)

(defsystem "irobot_create_2_1-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Demo" :depends-on ("_package_Demo"))
    (:file "_package_Demo" :depends-on ("_package"))
    (:file "Turn" :depends-on ("_package_Turn"))
    (:file "_package_Turn" :depends-on ("_package"))
    (:file "Leds" :depends-on ("_package_Leds"))
    (:file "_package_Leds" :depends-on ("_package"))
    (:file "Circle" :depends-on ("_package_Circle"))
    (:file "_package_Circle" :depends-on ("_package"))
    (:file "Tank" :depends-on ("_package_Tank"))
    (:file "_package_Tank" :depends-on ("_package"))
    (:file "Brake" :depends-on ("_package_Brake"))
    (:file "_package_Brake" :depends-on ("_package"))
  ))