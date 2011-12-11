(require :iterate)
(use-package :iterate)

(defun collatz-length (n)
  (if (eql n 1)
      1
      (1+ (collatz-length (if (evenp n) (/ n 2) (1+ (* 3 n)))))))

(defun euler014 (&optional (max 1000000))
  (iter (for i :from 1 :to max)
        (finding i :maximizing #'collatz-length)))
