(defun factorial (n)
  (if (plusp n)
      (* n (factorial (1- n)))
      1))

(defun euler020 (&optional (n 100))
  (reduce #'+ (princ-to-string (factorial n)) :key #'digit-char-p))
