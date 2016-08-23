; Auto-generated. Do not edit!


(cl:in-package irobot_create_2_1-srv)


;//! \htmlinclude Brake-request.msg.html

(cl:defclass <Brake-request> (roslisp-msg-protocol:ros-message)
  ((brake
    :reader brake
    :initarg :brake
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Brake-request (<Brake-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Brake-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Brake-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name irobot_create_2_1-srv:<Brake-request> is deprecated: use irobot_create_2_1-srv:Brake-request instead.")))

(cl:ensure-generic-function 'brake-val :lambda-list '(m))
(cl:defmethod brake-val ((m <Brake-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-srv:brake-val is deprecated.  Use irobot_create_2_1-srv:brake instead.")
  (brake m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Brake-request>) ostream)
  "Serializes a message object of type '<Brake-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'brake) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Brake-request>) istream)
  "Deserializes a message object of type '<Brake-request>"
    (cl:setf (cl:slot-value msg 'brake) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Brake-request>)))
  "Returns string type for a service object of type '<Brake-request>"
  "irobot_create_2_1/BrakeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Brake-request)))
  "Returns string type for a service object of type 'Brake-request"
  "irobot_create_2_1/BrakeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Brake-request>)))
  "Returns md5sum for a message object of type '<Brake-request>"
  "c154fccc169551daeea068d31d0a6b63")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Brake-request)))
  "Returns md5sum for a message object of type 'Brake-request"
  "c154fccc169551daeea068d31d0a6b63")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Brake-request>)))
  "Returns full string definition for message of type '<Brake-request>"
  (cl:format cl:nil "bool brake~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Brake-request)))
  "Returns full string definition for message of type 'Brake-request"
  (cl:format cl:nil "bool brake~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Brake-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Brake-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Brake-request
    (cl:cons ':brake (brake msg))
))
;//! \htmlinclude Brake-response.msg.html

(cl:defclass <Brake-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Brake-response (<Brake-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Brake-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Brake-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name irobot_create_2_1-srv:<Brake-response> is deprecated: use irobot_create_2_1-srv:Brake-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <Brake-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-srv:success-val is deprecated.  Use irobot_create_2_1-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Brake-response>) ostream)
  "Serializes a message object of type '<Brake-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Brake-response>) istream)
  "Deserializes a message object of type '<Brake-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Brake-response>)))
  "Returns string type for a service object of type '<Brake-response>"
  "irobot_create_2_1/BrakeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Brake-response)))
  "Returns string type for a service object of type 'Brake-response"
  "irobot_create_2_1/BrakeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Brake-response>)))
  "Returns md5sum for a message object of type '<Brake-response>"
  "c154fccc169551daeea068d31d0a6b63")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Brake-response)))
  "Returns md5sum for a message object of type 'Brake-response"
  "c154fccc169551daeea068d31d0a6b63")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Brake-response>)))
  "Returns full string definition for message of type '<Brake-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Brake-response)))
  "Returns full string definition for message of type 'Brake-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Brake-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Brake-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Brake-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Brake)))
  'Brake-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Brake)))
  'Brake-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Brake)))
  "Returns string type for a service object of type '<Brake>"
  "irobot_create_2_1/Brake")