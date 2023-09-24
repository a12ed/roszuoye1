;; Auto-generated. Do not edit!


(when (boundp 'topic::time)
  (if (not (find-package "TOPIC"))
    (make-package "TOPIC"))
  (shadow 'time (find-package "TOPIC")))
(unless (find-package "TOPIC::TIME")
  (make-package "TOPIC::TIME"))

(in-package "ROS")
;;//! \htmlinclude time.msg.html


(defclass topic::time
  :super ros::object
  :slots (_time _sign ))

(defmethod topic::time
  (:init
   (&key
    ((:time __time) 0.0)
    ((:sign __sign) 0)
    )
   (send-super :init)
   (setq _time (float __time))
   (setq _sign (round __sign))
   self)
  (:time
   (&optional __time)
   (if __time (setq _time __time)) _time)
  (:sign
   (&optional __sign)
   (if __sign (setq _sign __sign)) _sign)
  (:serialization-length
   ()
   (+
    ;; float64 _time
    8
    ;; uint8 _sign
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _time
       (sys::poke _time (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint8 _sign
       (write-byte _sign s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _time
     (setq _time (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint8 _sign
     (setq _sign (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get topic::time :md5sum-) "f47d867e0932ea6a0ba2bc35171d3684")
(setf (get topic::time :datatype-) "topic/time")
(setf (get topic::time :definition-)
      "float64 time
uint8 sign

")



(provide :topic/time "f47d867e0932ea6a0ba2bc35171d3684")


