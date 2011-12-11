(defconstant +phi+ (/ (1+ (sqrt 5d0)) 2))

;; NB: does not yield the right answer if +phi+ is a single-float.
(defun fib (n)
  (round (/ (expt +phi+ n) (sqrt 5d0))))

(defun euler002 ()
  (loop for i from 1
        for even-fib = (fib (* 3 i))
        while (<= even-fib 4e6)
        sum even-fib))
