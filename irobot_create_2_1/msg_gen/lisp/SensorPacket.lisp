; Auto-generated. Do not edit!


(cl:in-package irobot_create_2_1-msg)


;//! \htmlinclude SensorPacket.msg.html

(cl:defclass <SensorPacket> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (wheeldropCaster
    :reader wheeldropCaster
    :initarg :wheeldropCaster
    :type cl:boolean
    :initform cl:nil)
   (wheeldropLeft
    :reader wheeldropLeft
    :initarg :wheeldropLeft
    :type cl:boolean
    :initform cl:nil)
   (wheeldropRight
    :reader wheeldropRight
    :initarg :wheeldropRight
    :type cl:boolean
    :initform cl:nil)
   (bumpLeft
    :reader bumpLeft
    :initarg :bumpLeft
    :type cl:boolean
    :initform cl:nil)
   (bumpRight
    :reader bumpRight
    :initarg :bumpRight
    :type cl:boolean
    :initform cl:nil)
   (wall
    :reader wall
    :initarg :wall
    :type cl:boolean
    :initform cl:nil)
   (cliffLeft
    :reader cliffLeft
    :initarg :cliffLeft
    :type cl:boolean
    :initform cl:nil)
   (cliffFronLeft
    :reader cliffFronLeft
    :initarg :cliffFronLeft
    :type cl:boolean
    :initform cl:nil)
   (cliffFrontRight
    :reader cliffFrontRight
    :initarg :cliffFrontRight
    :type cl:boolean
    :initform cl:nil)
   (cliffRight
    :reader cliffRight
    :initarg :cliffRight
    :type cl:boolean
    :initform cl:nil)
   (virtualWall
    :reader virtualWall
    :initarg :virtualWall
    :type cl:boolean
    :initform cl:nil)
   (infraredByte
    :reader infraredByte
    :initarg :infraredByte
    :type cl:fixnum
    :initform 0)
   (advance
    :reader advance
    :initarg :advance
    :type cl:boolean
    :initform cl:nil)
   (play
    :reader play
    :initarg :play
    :type cl:boolean
    :initform cl:nil)
   (distance
    :reader distance
    :initarg :distance
    :type cl:fixnum
    :initform 0)
   (angle
    :reader angle
    :initarg :angle
    :type cl:fixnum
    :initform 0)
   (chargingState
    :reader chargingState
    :initarg :chargingState
    :type cl:fixnum
    :initform 0)
   (voltage
    :reader voltage
    :initarg :voltage
    :type cl:fixnum
    :initform 0)
   (current
    :reader current
    :initarg :current
    :type cl:fixnum
    :initform 0)
   (batteryTemperature
    :reader batteryTemperature
    :initarg :batteryTemperature
    :type cl:fixnum
    :initform 0)
   (batteryCharge
    :reader batteryCharge
    :initarg :batteryCharge
    :type cl:fixnum
    :initform 0)
   (batteryCapacity
    :reader batteryCapacity
    :initarg :batteryCapacity
    :type cl:fixnum
    :initform 0)
   (wallSignal
    :reader wallSignal
    :initarg :wallSignal
    :type cl:fixnum
    :initform 0)
   (cliffLeftSignal
    :reader cliffLeftSignal
    :initarg :cliffLeftSignal
    :type cl:fixnum
    :initform 0)
   (cliffFrontLeftSignal
    :reader cliffFrontLeftSignal
    :initarg :cliffFrontLeftSignal
    :type cl:fixnum
    :initform 0)
   (cliffFrontRightSignal
    :reader cliffFrontRightSignal
    :initarg :cliffFrontRightSignal
    :type cl:fixnum
    :initform 0)
   (cliffRightSignal
    :reader cliffRightSignal
    :initarg :cliffRightSignal
    :type cl:fixnum
    :initform 0)
   (homeBase
    :reader homeBase
    :initarg :homeBase
    :type cl:boolean
    :initform cl:nil)
   (internalCharger
    :reader internalCharger
    :initarg :internalCharger
    :type cl:boolean
    :initform cl:nil)
   (songNumber
    :reader songNumber
    :initarg :songNumber
    :type cl:fixnum
    :initform 0)
   (songPlaying
    :reader songPlaying
    :initarg :songPlaying
    :type cl:fixnum
    :initform 0))
)

(cl:defclass SensorPacket (<SensorPacket>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SensorPacket>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SensorPacket)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name irobot_create_2_1-msg:<SensorPacket> is deprecated: use irobot_create_2_1-msg:SensorPacket instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <SensorPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-msg:header-val is deprecated.  Use irobot_create_2_1-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'wheeldropCaster-val :lambda-list '(m))
(cl:defmethod wheeldropCaster-val ((m <SensorPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-msg:wheeldropCaster-val is deprecated.  Use irobot_create_2_1-msg:wheeldropCaster instead.")
  (wheeldropCaster m))

(cl:ensure-generic-function 'wheeldropLeft-val :lambda-list '(m))
(cl:defmethod wheeldropLeft-val ((m <SensorPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-msg:wheeldropLeft-val is deprecated.  Use irobot_create_2_1-msg:wheeldropLeft instead.")
  (wheeldropLeft m))

(cl:ensure-generic-function 'wheeldropRight-val :lambda-list '(m))
(cl:defmethod wheeldropRight-val ((m <SensorPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-msg:wheeldropRight-val is deprecated.  Use irobot_create_2_1-msg:wheeldropRight instead.")
  (wheeldropRight m))

(cl:ensure-generic-function 'bumpLeft-val :lambda-list '(m))
(cl:defmethod bumpLeft-val ((m <SensorPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-msg:bumpLeft-val is deprecated.  Use irobot_create_2_1-msg:bumpLeft instead.")
  (bumpLeft m))

(cl:ensure-generic-function 'bumpRight-val :lambda-list '(m))
(cl:defmethod bumpRight-val ((m <SensorPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-msg:bumpRight-val is deprecated.  Use irobot_create_2_1-msg:bumpRight instead.")
  (bumpRight m))

(cl:ensure-generic-function 'wall-val :lambda-list '(m))
(cl:defmethod wall-val ((m <SensorPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-msg:wall-val is deprecated.  Use irobot_create_2_1-msg:wall instead.")
  (wall m))

(cl:ensure-generic-function 'cliffLeft-val :lambda-list '(m))
(cl:defmethod cliffLeft-val ((m <SensorPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-msg:cliffLeft-val is deprecated.  Use irobot_create_2_1-msg:cliffLeft instead.")
  (cliffLeft m))

(cl:ensure-generic-function 'cliffFronLeft-val :lambda-list '(m))
(cl:defmethod cliffFronLeft-val ((m <SensorPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-msg:cliffFronLeft-val is deprecated.  Use irobot_create_2_1-msg:cliffFronLeft instead.")
  (cliffFronLeft m))

(cl:ensure-generic-function 'cliffFrontRight-val :lambda-list '(m))
(cl:defmethod cliffFrontRight-val ((m <SensorPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-msg:cliffFrontRight-val is deprecated.  Use irobot_create_2_1-msg:cliffFrontRight instead.")
  (cliffFrontRight m))

(cl:ensure-generic-function 'cliffRight-val :lambda-list '(m))
(cl:defmethod cliffRight-val ((m <SensorPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-msg:cliffRight-val is deprecated.  Use irobot_create_2_1-msg:cliffRight instead.")
  (cliffRight m))

(cl:ensure-generic-function 'virtualWall-val :lambda-list '(m))
(cl:defmethod virtualWall-val ((m <SensorPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-msg:virtualWall-val is deprecated.  Use irobot_create_2_1-msg:virtualWall instead.")
  (virtualWall m))

(cl:ensure-generic-function 'infraredByte-val :lambda-list '(m))
(cl:defmethod infraredByte-val ((m <SensorPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-msg:infraredByte-val is deprecated.  Use irobot_create_2_1-msg:infraredByte instead.")
  (infraredByte m))

(cl:ensure-generic-function 'advance-val :lambda-list '(m))
(cl:defmethod advance-val ((m <SensorPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-msg:advance-val is deprecated.  Use irobot_create_2_1-msg:advance instead.")
  (advance m))

(cl:ensure-generic-function 'play-val :lambda-list '(m))
(cl:defmethod play-val ((m <SensorPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-msg:play-val is deprecated.  Use irobot_create_2_1-msg:play instead.")
  (play m))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <SensorPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-msg:distance-val is deprecated.  Use irobot_create_2_1-msg:distance instead.")
  (distance m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <SensorPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-msg:angle-val is deprecated.  Use irobot_create_2_1-msg:angle instead.")
  (angle m))

(cl:ensure-generic-function 'chargingState-val :lambda-list '(m))
(cl:defmethod chargingState-val ((m <SensorPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-msg:chargingState-val is deprecated.  Use irobot_create_2_1-msg:chargingState instead.")
  (chargingState m))

(cl:ensure-generic-function 'voltage-val :lambda-list '(m))
(cl:defmethod voltage-val ((m <SensorPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-msg:voltage-val is deprecated.  Use irobot_create_2_1-msg:voltage instead.")
  (voltage m))

(cl:ensure-generic-function 'current-val :lambda-list '(m))
(cl:defmethod current-val ((m <SensorPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-msg:current-val is deprecated.  Use irobot_create_2_1-msg:current instead.")
  (current m))

(cl:ensure-generic-function 'batteryTemperature-val :lambda-list '(m))
(cl:defmethod batteryTemperature-val ((m <SensorPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-msg:batteryTemperature-val is deprecated.  Use irobot_create_2_1-msg:batteryTemperature instead.")
  (batteryTemperature m))

(cl:ensure-generic-function 'batteryCharge-val :lambda-list '(m))
(cl:defmethod batteryCharge-val ((m <SensorPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-msg:batteryCharge-val is deprecated.  Use irobot_create_2_1-msg:batteryCharge instead.")
  (batteryCharge m))

(cl:ensure-generic-function 'batteryCapacity-val :lambda-list '(m))
(cl:defmethod batteryCapacity-val ((m <SensorPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-msg:batteryCapacity-val is deprecated.  Use irobot_create_2_1-msg:batteryCapacity instead.")
  (batteryCapacity m))

(cl:ensure-generic-function 'wallSignal-val :lambda-list '(m))
(cl:defmethod wallSignal-val ((m <SensorPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-msg:wallSignal-val is deprecated.  Use irobot_create_2_1-msg:wallSignal instead.")
  (wallSignal m))

(cl:ensure-generic-function 'cliffLeftSignal-val :lambda-list '(m))
(cl:defmethod cliffLeftSignal-val ((m <SensorPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-msg:cliffLeftSignal-val is deprecated.  Use irobot_create_2_1-msg:cliffLeftSignal instead.")
  (cliffLeftSignal m))

(cl:ensure-generic-function 'cliffFrontLeftSignal-val :lambda-list '(m))
(cl:defmethod cliffFrontLeftSignal-val ((m <SensorPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-msg:cliffFrontLeftSignal-val is deprecated.  Use irobot_create_2_1-msg:cliffFrontLeftSignal instead.")
  (cliffFrontLeftSignal m))

(cl:ensure-generic-function 'cliffFrontRightSignal-val :lambda-list '(m))
(cl:defmethod cliffFrontRightSignal-val ((m <SensorPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-msg:cliffFrontRightSignal-val is deprecated.  Use irobot_create_2_1-msg:cliffFrontRightSignal instead.")
  (cliffFrontRightSignal m))

(cl:ensure-generic-function 'cliffRightSignal-val :lambda-list '(m))
(cl:defmethod cliffRightSignal-val ((m <SensorPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-msg:cliffRightSignal-val is deprecated.  Use irobot_create_2_1-msg:cliffRightSignal instead.")
  (cliffRightSignal m))

(cl:ensure-generic-function 'homeBase-val :lambda-list '(m))
(cl:defmethod homeBase-val ((m <SensorPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-msg:homeBase-val is deprecated.  Use irobot_create_2_1-msg:homeBase instead.")
  (homeBase m))

(cl:ensure-generic-function 'internalCharger-val :lambda-list '(m))
(cl:defmethod internalCharger-val ((m <SensorPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-msg:internalCharger-val is deprecated.  Use irobot_create_2_1-msg:internalCharger instead.")
  (internalCharger m))

(cl:ensure-generic-function 'songNumber-val :lambda-list '(m))
(cl:defmethod songNumber-val ((m <SensorPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-msg:songNumber-val is deprecated.  Use irobot_create_2_1-msg:songNumber instead.")
  (songNumber m))

(cl:ensure-generic-function 'songPlaying-val :lambda-list '(m))
(cl:defmethod songPlaying-val ((m <SensorPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader irobot_create_2_1-msg:songPlaying-val is deprecated.  Use irobot_create_2_1-msg:songPlaying instead.")
  (songPlaying m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SensorPacket>) ostream)
  "Serializes a message object of type '<SensorPacket>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'wheeldropCaster) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'wheeldropLeft) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'wheeldropRight) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'bumpLeft) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'bumpRight) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'wall) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'cliffLeft) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'cliffFronLeft) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'cliffFrontRight) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'cliffRight) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'virtualWall) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'infraredByte)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'advance) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'play) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'distance)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'angle)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'chargingState)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'voltage)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'voltage)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'current)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'batteryTemperature)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'batteryCharge)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'batteryCharge)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'batteryCapacity)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'batteryCapacity)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'wallSignal)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'wallSignal)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cliffLeftSignal)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'cliffLeftSignal)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cliffFrontLeftSignal)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'cliffFrontLeftSignal)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cliffFrontRightSignal)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'cliffFrontRightSignal)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cliffRightSignal)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'cliffRightSignal)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'homeBase) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'internalCharger) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'songNumber)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'songPlaying)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SensorPacket>) istream)
  "Deserializes a message object of type '<SensorPacket>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'wheeldropCaster) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'wheeldropLeft) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'wheeldropRight) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'bumpLeft) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'bumpRight) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'wall) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'cliffLeft) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'cliffFronLeft) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'cliffFrontRight) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'cliffRight) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'virtualWall) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'infraredByte)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'advance) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'play) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'distance) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'angle) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'chargingState)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'voltage)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'voltage)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'current) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'batteryTemperature) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'batteryCharge)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'batteryCharge)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'batteryCapacity)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'batteryCapacity)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'wallSignal)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'wallSignal)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cliffLeftSignal)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'cliffLeftSignal)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cliffFrontLeftSignal)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'cliffFrontLeftSignal)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cliffFrontRightSignal)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'cliffFrontRightSignal)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cliffRightSignal)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'cliffRightSignal)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'homeBase) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'internalCharger) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'songNumber)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'songPlaying)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SensorPacket>)))
  "Returns string type for a message object of type '<SensorPacket>"
  "irobot_create_2_1/SensorPacket")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SensorPacket)))
  "Returns string type for a message object of type 'SensorPacket"
  "irobot_create_2_1/SensorPacket")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SensorPacket>)))
  "Returns md5sum for a message object of type '<SensorPacket>"
  "56f92e8d70d283e7e15aa47855e73ea7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SensorPacket)))
  "Returns md5sum for a message object of type 'SensorPacket"
  "56f92e8d70d283e7e15aa47855e73ea7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SensorPacket>)))
  "Returns full string definition for message of type '<SensorPacket>"
  (cl:format cl:nil "Header header~%bool wheeldropCaster~%bool wheeldropLeft~%bool wheeldropRight~%bool bumpLeft~%bool bumpRight~%bool wall~%bool cliffLeft~%bool cliffFronLeft~%bool cliffFrontRight~%bool cliffRight~%bool virtualWall~%uint8 infraredByte~%bool advance~%bool play~%int16 distance~%int16 angle~%uint8 chargingState~%uint16 voltage~%int16 current~%int8 batteryTemperature~%uint16 batteryCharge~%uint16 batteryCapacity~%uint16 wallSignal~%uint16 cliffLeftSignal~%uint16 cliffFrontLeftSignal~%uint16 cliffFrontRightSignal~%uint16 cliffRightSignal~%bool homeBase~%bool internalCharger~%uint8 songNumber~%uint8 songPlaying~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SensorPacket)))
  "Returns full string definition for message of type 'SensorPacket"
  (cl:format cl:nil "Header header~%bool wheeldropCaster~%bool wheeldropLeft~%bool wheeldropRight~%bool bumpLeft~%bool bumpRight~%bool wall~%bool cliffLeft~%bool cliffFronLeft~%bool cliffFrontRight~%bool cliffRight~%bool virtualWall~%uint8 infraredByte~%bool advance~%bool play~%int16 distance~%int16 angle~%uint8 chargingState~%uint16 voltage~%int16 current~%int8 batteryTemperature~%uint16 batteryCharge~%uint16 batteryCapacity~%uint16 wallSignal~%uint16 cliffLeftSignal~%uint16 cliffFrontLeftSignal~%uint16 cliffFrontRightSignal~%uint16 cliffRightSignal~%bool homeBase~%bool internalCharger~%uint8 songNumber~%uint8 songPlaying~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SensorPacket>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     2
     2
     1
     2
     2
     1
     2
     2
     2
     2
     2
     2
     2
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SensorPacket>))
  "Converts a ROS message object to a list"
  (cl:list 'SensorPacket
    (cl:cons ':header (header msg))
    (cl:cons ':wheeldropCaster (wheeldropCaster msg))
    (cl:cons ':wheeldropLeft (wheeldropLeft msg))
    (cl:cons ':wheeldropRight (wheeldropRight msg))
    (cl:cons ':bumpLeft (bumpLeft msg))
    (cl:cons ':bumpRight (bumpRight msg))
    (cl:cons ':wall (wall msg))
    (cl:cons ':cliffLeft (cliffLeft msg))
    (cl:cons ':cliffFronLeft (cliffFronLeft msg))
    (cl:cons ':cliffFrontRight (cliffFrontRight msg))
    (cl:cons ':cliffRight (cliffRight msg))
    (cl:cons ':virtualWall (virtualWall msg))
    (cl:cons ':infraredByte (infraredByte msg))
    (cl:cons ':advance (advance msg))
    (cl:cons ':play (play msg))
    (cl:cons ':distance (distance msg))
    (cl:cons ':angle (angle msg))
    (cl:cons ':chargingState (chargingState msg))
    (cl:cons ':voltage (voltage msg))
    (cl:cons ':current (current msg))
    (cl:cons ':batteryTemperature (batteryTemperature msg))
    (cl:cons ':batteryCharge (batteryCharge msg))
    (cl:cons ':batteryCapacity (batteryCapacity msg))
    (cl:cons ':wallSignal (wallSignal msg))
    (cl:cons ':cliffLeftSignal (cliffLeftSignal msg))
    (cl:cons ':cliffFrontLeftSignal (cliffFrontLeftSignal msg))
    (cl:cons ':cliffFrontRightSignal (cliffFrontRightSignal msg))
    (cl:cons ':cliffRightSignal (cliffRightSignal msg))
    (cl:cons ':homeBase (homeBase msg))
    (cl:cons ':internalCharger (internalCharger msg))
    (cl:cons ':songNumber (songNumber msg))
    (cl:cons ':songPlaying (songPlaying msg))
))
