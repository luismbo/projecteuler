(defun sum-proper-divisors (n)
  (loop for i from 1 upto (max 1 (truncate n 2))
        when (zerop (mod n i))
          sum i))

(defun euler021 ()
  (loop for i from 1 below 10000
        for sum = (sum-proper-divisors i)
        when (and (not (eql i sum))
                  (eql i (sum-proper-divisors sum)))
          sum i))
