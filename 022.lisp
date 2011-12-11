(defun read-sorted-names ()
  (with-open-file (in (merge-pathnames "names.txt" #.*compile-file-pathname*)
                      :direction :input)
    (sort (loop for word = (read in nil)
                while (stringp word)
                collect word
                do (read-char in nil))
          #'string<)))

(defun word-value (word)
  (loop for ch across word
        sum (1+ (position ch "ABCDEFGHIJKLMNOPQRSTUVWXYZ"))))

(defun euler022 ()
  (loop for i from 1 and word in (read-sorted-names)
        sum (* i (word-value word))))
