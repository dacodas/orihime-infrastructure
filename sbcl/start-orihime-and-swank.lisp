(ql:quickload '(:orihime :swank))

(setf SB-IMPL::*DEFAULT-EXTERNAL-FORMAT* :utf-8)

(setf swank::*LOOPBACK-INTERFACE* "0.0.0.0")
(defparameter *server* (swank:create-server :port 4005 :style :spawn :dont-close t))
(loop (sleep 60))
