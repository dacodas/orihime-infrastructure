(ql:quickload '(:orihime :swank))

;; Grab the environment variables populated by k8s, there must be a nicer way to do this
(asdf-utilities:compile-system :orihime :force t)

(setf SB-IMPL::*DEFAULT-EXTERNAL-FORMAT* :utf-8)

(setf swank::*LOOPBACK-INTERFACE* "0.0.0.0")
(defparameter *server* (swank:create-server :port 4005 :style :spawn :dont-close t))
(loop (sleep 60))
