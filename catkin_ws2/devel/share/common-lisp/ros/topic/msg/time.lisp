; Auto-generated. Do not edit!


(cl:in-package topic-msg)


;//! \htmlinclude time.msg.html

(cl:defclass <time> (roslisp-msg-protocol:ros-message)
  ((time
    :reader time
    :initarg :time
    :type cl:float
    :initform 0.0)
   (sign
    :reader sign
    :initarg :sign
    :type cl:fixnum
    :initform 0))
)

(cl:defclass time (<time>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <time>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'time)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name topic-msg:<time> is deprecated: use topic-msg:time instead.")))

(cl:ensure-generic-function 'time-val :lambda-list '(m))
(cl:defmethod time-val ((m <time>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader topic-msg:time-val is deprecated.  Use topic-msg:time instead.")
  (time m))

(cl:ensure-generic-function 'sign-val :lambda-list '(m))
(cl:defmethod sign-val ((m <time>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader topic-msg:sign-val is deprecated.  Use topic-msg:sign instead.")
  (sign m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <time>) ostream)
  "Serializes a message object of type '<time>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sign)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <time>) istream)
  "Deserializes a message object of type '<time>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'time) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sign)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<time>)))
  "Returns string type for a message object of type '<time>"
  "topic/time")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'time)))
  "Returns string type for a message object of type 'time"
  "topic/time")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<time>)))
  "Returns md5sum for a message object of type '<time>"
  "f47d867e0932ea6a0ba2bc35171d3684")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'time)))
  "Returns md5sum for a message object of type 'time"
  "f47d867e0932ea6a0ba2bc35171d3684")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<time>)))
  "Returns full string definition for message of type '<time>"
  (cl:format cl:nil "float64 time~%uint8 sign~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'time)))
  "Returns full string definition for message of type 'time"
  (cl:format cl:nil "float64 time~%uint8 sign~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <time>))
  (cl:+ 0
     8
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <time>))
  "Converts a ROS message object to a list"
  (cl:list 'time
    (cl:cons ':time (time msg))
    (cl:cons ':sign (sign msg))
))
