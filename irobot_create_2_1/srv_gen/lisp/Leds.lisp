; Auto-generated. Do not edit!


(cl:in-package irobot_create_2_1-srv)


;//! \htmlinclude Leds-request.msg.html

(cl:defclass <Leds-request> (roslisp-msg-protocol:ros-message)
  ((advance
    :reader advance
    :initarg :advance
    :type cl:boolean
    :initform cl:nil)
   (play
    :reader play
    :initarg :play
    :type cl:boolean
    :initform cl:nil)
   (color
    :reader color
    :initarg :color
    :type cl:fixnum
    :initform 0)
   (intensity
    :reader intensity
    :initarg :intensity
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Leds-request (<Leds-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Leds-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Leds-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name irobot_create_2_1-srv:<Leds-request> is deprecated: use irobot_create_2_1-srv:Leds-request instead.")))

(cl:ensure-generic-function 'advance-val :lambda-list '(m))
(cl:defmethod advance-val ((m <Leds-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-srv:advance-val is deprecated.  Use irobot_create_2_1-srv:advance instead.")
  (advance m))

(cl:ensure-generic-function 'play-val :lambda-list '(m))
(cl:defmethod play-val ((m <Leds-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-srv:play-val is deprecated.  Use irobot_create_2_1-srv:play instead.")
  (play m))

(cl:ensure-generic-function 'color-val :lambda-list '(m))
(cl:defmethod color-val ((m <Leds-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-srv:color-val is deprecated.  Use irobot_create_2_1-srv:color instead.")
  (color m))

(cl:ensure-generic-function 'intensity-val :lambda-list '(m))
(cl:defmethod intensity-val ((m <Leds-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-srv:intensity-val is deprecated.  Use irobot_create_2_1-srv:intensity instead.")
  (intensity m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Leds-request>) ostream)
  "Serializes a message object of type '<Leds-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'advance) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'play) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'color)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'intensity)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Leds-request>) istream)
  "Deserializes a message object of type '<Leds-request>"
    (cl:setf (cl:slot-value msg 'advance) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'play) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'color)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'intensity)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Leds-request>)))
  "Returns string type for a service object of type '<Leds-request>"
  "irobot_create_2_1/LedsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Leds-request)))
  "Returns string type for a service object of type 'Leds-request"
  "irobot_create_2_1/LedsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Leds-request>)))
  "Returns md5sum for a message object of type '<Leds-request>"
  "926a8fe91d451f4d4bb099ec9e86ff14")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Leds-request)))
  "Returns md5sum for a message object of type 'Leds-request"
  "926a8fe91d451f4d4bb099ec9e86ff14")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Leds-request>)))
  "Returns full string definition for message of type '<Leds-request>"
  (cl:format cl:nil "bool advance~%bool play~%uint8 color~%uint8 intensity~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Leds-request)))
  "Returns full string definition for message of type 'Leds-request"
  (cl:format cl:nil "bool advance~%bool play~%uint8 color~%uint8 intensity~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Leds-request>))
  (cl:+ 0
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Leds-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Leds-request
    (cl:cons ':advance (advance msg))
    (cl:cons ':play (play msg))
    (cl:cons ':color (color msg))
    (cl:cons ':intensity (intensity msg))
))
;//! \htmlinclude Leds-response.msg.html

(cl:defclass <Leds-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Leds-response (<Leds-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Leds-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Leds-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name irobot_create_2_1-srv:<Leds-response> is deprecated: use irobot_create_2_1-srv:Leds-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <Leds-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-srv:success-val is deprecated.  Use irobot_create_2_1-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Leds-response>) ostream)
  "Serializes a message object of type '<Leds-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Leds-response>) istream)
  "Deserializes a message object of type '<Leds-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Leds-response>)))
  "Returns string type for a service object of type '<Leds-response>"
  "irobot_create_2_1/LedsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Leds-response)))
  "Returns string type for a service object of type 'Leds-response"
  "irobot_create_2_1/LedsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Leds-response>)))
  "Returns md5sum for a message object of type '<Leds-response>"
  "926a8fe91d451f4d4bb099ec9e86ff14")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Leds-response)))
  "Returns md5sum for a message object of type 'Leds-response"
  "926a8fe91d451f4d4bb099ec9e86ff14")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Leds-response>)))
  "Returns full string definition for message of type '<Leds-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Leds-response)))
  "Returns full string definition for message of type 'Leds-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Leds-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Leds-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Leds-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Leds)))
  'Leds-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Leds)))
  'Leds-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Leds)))
  "Returns string type for a service object of type '<Leds>"
  "irobot_create_2_1/Leds")