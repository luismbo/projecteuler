(defun euler017 (&optional (limit 1000))
  (loop for i from 1 upto limit
        sum (+ (length (remove-if-not #'alpha-char-p (format nil "~R" i)))
               ;; accounting for the "and" separators between hundreds
               ;; and tens that ~R doesn't print.
               (print (if (and (< 100 i 1000) (not (zerop (mod i 100))))
                          3
                          0)))))
