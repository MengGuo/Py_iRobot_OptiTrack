; Auto-generated. Do not edit!


(cl:in-package irobot_create_2_1-srv)


;//! \htmlinclude Turn-request.msg.html

(cl:defclass <Turn-request> (roslisp-msg-protocol:ros-message)
  ((clear
    :reader clear
    :initarg :clear
    :type cl:boolean
    :initform cl:nil)
   (turn
    :reader turn
    :initarg :turn
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Turn-request (<Turn-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Turn-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Turn-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name irobot_create_2_1-srv:<Turn-request> is deprecated: use irobot_create_2_1-srv:Turn-request instead.")))

(cl:ensure-generic-function 'clear-val :lambda-list '(m))
(cl:defmethod clear-val ((m <Turn-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-srv:clear-val is deprecated.  Use irobot_create_2_1-srv:clear instead.")
  (clear m))

(cl:ensure-generic-function 'turn-val :lambda-list '(m))
(cl:defmethod turn-val ((m <Turn-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-srv:turn-val is deprecated.  Use irobot_create_2_1-srv:turn instead.")
  (turn m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Turn-request>) ostream)
  "Serializes a message object of type '<Turn-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'clear) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'turn)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Turn-request>) istream)
  "Deserializes a message object of type '<Turn-request>"
    (cl:setf (cl:slot-value msg 'clear) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'turn) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Turn-request>)))
  "Returns string type for a service object of type '<Turn-request>"
  "irobot_create_2_1/TurnRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Turn-request)))
  "Returns string type for a service object of type 'Turn-request"
  "irobot_create_2_1/TurnRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Turn-request>)))
  "Returns md5sum for a message object of type '<Turn-request>"
  "f28782ca6cac906741095df052f0ccc1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Turn-request)))
  "Returns md5sum for a message object of type 'Turn-request"
  "f28782ca6cac906741095df052f0ccc1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Turn-request>)))
  "Returns full string definition for message of type '<Turn-request>"
  (cl:format cl:nil "bool clear~%int16 turn~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Turn-request)))
  "Returns full string definition for message of type 'Turn-request"
  (cl:format cl:nil "bool clear~%int16 turn~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Turn-request>))
  (cl:+ 0
     1
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Turn-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Turn-request
    (cl:cons ':clear (clear msg))
    (cl:cons ':turn (turn msg))
))
;//! \htmlinclude Turn-response.msg.html

(cl:defclass <Turn-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Turn-response (<Turn-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Turn-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Turn-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name irobot_create_2_1-srv:<Turn-response> is deprecated: use irobot_create_2_1-srv:Turn-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <Turn-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-srv:success-val is deprecated.  Use irobot_create_2_1-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Turn-response>) ostream)
  "Serializes a message object of type '<Turn-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Turn-response>) istream)
  "Deserializes a message object of type '<Turn-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Turn-response>)))
  "Returns string type for a service object of type '<Turn-response>"
  "irobot_create_2_1/TurnResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Turn-response)))
  "Returns string type for a service object of type 'Turn-response"
  "irobot_create_2_1/TurnResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Turn-response>)))
  "Returns md5sum for a message object of type '<Turn-response>"
  "f28782ca6cac906741095df052f0ccc1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Turn-response)))
  "Returns md5sum for a message object of type 'Turn-response"
  "f28782ca6cac906741095df052f0ccc1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Turn-response>)))
  "Returns full string definition for message of type '<Turn-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Turn-response)))
  "Returns full string definition for message of type 'Turn-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Turn-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Turn-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Turn-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Turn)))
  'Turn-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Turn)))
  'Turn-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Turn)))
  "Returns string type for a service object of type '<Turn>"
  "irobot_create_2_1/Turn")