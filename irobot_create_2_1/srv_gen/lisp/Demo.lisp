; Auto-generated. Do not edit!


(cl:in-package irobot_create_2_1-srv)


;//! \htmlinclude Demo-request.msg.html

(cl:defclass <Demo-request> (roslisp-msg-protocol:ros-message)
  ((demo
    :reader demo
    :initarg :demo
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Demo-request (<Demo-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Demo-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Demo-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name irobot_create_2_1-srv:<Demo-request> is deprecated: use irobot_create_2_1-srv:Demo-request instead.")))

(cl:ensure-generic-function 'demo-val :lambda-list '(m))
(cl:defmethod demo-val ((m <Demo-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-srv:demo-val is deprecated.  Use irobot_create_2_1-srv:demo instead.")
  (demo m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Demo-request>) ostream)
  "Serializes a message object of type '<Demo-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'demo)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Demo-request>) istream)
  "Deserializes a message object of type '<Demo-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'demo)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Demo-request>)))
  "Returns string type for a service object of type '<Demo-request>"
  "irobot_create_2_1/DemoRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Demo-request)))
  "Returns string type for a service object of type 'Demo-request"
  "irobot_create_2_1/DemoRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Demo-request>)))
  "Returns md5sum for a message object of type '<Demo-request>"
  "ba6bc2ba3d93bab324b9d12a59c0df25")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Demo-request)))
  "Returns md5sum for a message object of type 'Demo-request"
  "ba6bc2ba3d93bab324b9d12a59c0df25")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Demo-request>)))
  "Returns full string definition for message of type '<Demo-request>"
  (cl:format cl:nil "uint8 demo~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Demo-request)))
  "Returns full string definition for message of type 'Demo-request"
  (cl:format cl:nil "uint8 demo~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Demo-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Demo-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Demo-request
    (cl:cons ':demo (demo msg))
))
;//! \htmlinclude Demo-response.msg.html

(cl:defclass <Demo-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Demo-response (<Demo-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Demo-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Demo-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name irobot_create_2_1-srv:<Demo-response> is deprecated: use irobot_create_2_1-srv:Demo-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <Demo-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-srv:success-val is deprecated.  Use irobot_create_2_1-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Demo-response>) ostream)
  "Serializes a message object of type '<Demo-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Demo-response>) istream)
  "Deserializes a message object of type '<Demo-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Demo-response>)))
  "Returns string type for a service object of type '<Demo-response>"
  "irobot_create_2_1/DemoResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Demo-response)))
  "Returns string type for a service object of type 'Demo-response"
  "irobot_create_2_1/DemoResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Demo-response>)))
  "Returns md5sum for a message object of type '<Demo-response>"
  "ba6bc2ba3d93bab324b9d12a59c0df25")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Demo-response)))
  "Returns md5sum for a message object of type 'Demo-response"
  "ba6bc2ba3d93bab324b9d12a59c0df25")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Demo-response>)))
  "Returns full string definition for message of type '<Demo-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Demo-response)))
  "Returns full string definition for message of type 'Demo-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Demo-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Demo-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Demo-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Demo)))
  'Demo-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Demo)))
  'Demo-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Demo)))
  "Returns string type for a service object of type '<Demo>"
  "irobot_create_2_1/Demo")