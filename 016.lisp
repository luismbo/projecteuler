(defun euler016 (&optional (exp 1000))
  (reduce #'+ (princ-to-string (expt 2 exp)) :key #'digit-char-p))
