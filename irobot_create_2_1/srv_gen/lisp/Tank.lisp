; Auto-generated. Do not edit!


(cl:in-package irobot_create_2_1-srv)


;//! \htmlinclude Tank-request.msg.html

(cl:defclass <Tank-request> (roslisp-msg-protocol:ros-message)
  ((clear
    :reader clear
    :initarg :clear
    :type cl:boolean
    :initform cl:nil)
   (left
    :reader left
    :initarg :left
    :type cl:fixnum
    :initform 0)
   (right
    :reader right
    :initarg :right
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Tank-request (<Tank-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Tank-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Tank-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name irobot_create_2_1-srv:<Tank-request> is deprecated: use irobot_create_2_1-srv:Tank-request instead.")))

(cl:ensure-generic-function 'clear-val :lambda-list '(m))
(cl:defmethod clear-val ((m <Tank-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-srv:clear-val is deprecated.  Use irobot_create_2_1-srv:clear instead.")
  (clear m))

(cl:ensure-generic-function 'left-val :lambda-list '(m))
(cl:defmethod left-val ((m <Tank-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-srv:left-val is deprecated.  Use irobot_create_2_1-srv:left instead.")
  (left m))

(cl:ensure-generic-function 'right-val :lambda-list '(m))
(cl:defmethod right-val ((m <Tank-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-srv:right-val is deprecated.  Use irobot_create_2_1-srv:right instead.")
  (right m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Tank-request>) ostream)
  "Serializes a message object of type '<Tank-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'clear) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'left)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'right)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Tank-request>) istream)
  "Deserializes a message object of type '<Tank-request>"
    (cl:setf (cl:slot-value msg 'clear) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'left) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'right) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Tank-request>)))
  "Returns string type for a service object of type '<Tank-request>"
  "irobot_create_2_1/TankRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Tank-request)))
  "Returns string type for a service object of type 'Tank-request"
  "irobot_create_2_1/TankRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Tank-request>)))
  "Returns md5sum for a message object of type '<Tank-request>"
  "745f1885a9f717c8b4a13cfddf382c30")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Tank-request)))
  "Returns md5sum for a message object of type 'Tank-request"
  "745f1885a9f717c8b4a13cfddf382c30")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Tank-request>)))
  "Returns full string definition for message of type '<Tank-request>"
  (cl:format cl:nil "bool clear~%int16 left~%int16 right~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Tank-request)))
  "Returns full string definition for message of type 'Tank-request"
  (cl:format cl:nil "bool clear~%int16 left~%int16 right~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Tank-request>))
  (cl:+ 0
     1
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Tank-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Tank-request
    (cl:cons ':clear (clear msg))
    (cl:cons ':left (left msg))
    (cl:cons ':right (right msg))
))
;//! \htmlinclude Tank-response.msg.html

(cl:defclass <Tank-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Tank-response (<Tank-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Tank-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Tank-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name irobot_create_2_1-srv:<Tank-response> is deprecated: use irobot_create_2_1-srv:Tank-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <Tank-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-srv:success-val is deprecated.  Use irobot_create_2_1-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Tank-response>) ostream)
  "Serializes a message object of type '<Tank-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Tank-response>) istream)
  "Deserializes a message object of type '<Tank-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Tank-response>)))
  "Returns string type for a service object of type '<Tank-response>"
  "irobot_create_2_1/TankResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Tank-response)))
  "Returns string type for a service object of type 'Tank-response"
  "irobot_create_2_1/TankResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Tank-response>)))
  "Returns md5sum for a message object of type '<Tank-response>"
  "745f1885a9f717c8b4a13cfddf382c30")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Tank-response)))
  "Returns md5sum for a message object of type 'Tank-response"
  "745f1885a9f717c8b4a13cfddf382c30")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Tank-response>)))
  "Returns full string definition for message of type '<Tank-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Tank-response)))
  "Returns full string definition for message of type 'Tank-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Tank-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Tank-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Tank-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Tank)))
  'Tank-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Tank)))
  'Tank-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Tank)))
  "Returns string type for a service object of type '<Tank>"
  "irobot_create_2_1/Tank")