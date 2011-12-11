(defparameter *triangle*
  #2A((75 -- -- -- -- -- -- -- -- -- -- -- -- -- --)
      (95 64 -- -- -- -- -- -- -- -- -- -- -- -- --)
      (17 47 82 -- -- -- -- -- -- -- -- -- -- -- --)
      (18 35 87 10 -- -- -- -- -- -- -- -- -- -- --)
      (20 04 82 47 65 -- -- -- -- -- -- -- -- -- --)
      (19 01 23 75 03 34 -- -- -- -- -- -- -- -- --)
      (88 02 77 73 07 63 67 -- -- -- -- -- -- -- --)
      (99 65 04 28 06 16 70 92 -- -- -- -- -- -- --)
      (41 41 26 56 83 40 80 70 33 -- -- -- -- -- --)
      (41 48 72 33 47 32 37 16 94 29 -- -- -- -- --)
      (53 71 44 65 25 43 91 52 97 51 14 -- -- -- --)
      (70 11 33 28 77 73 17 78 39 68 17 57 -- -- --)
      (91 71 52 38 17 14 91 43 58 50 27 29 48 -- --)
      (63 66 04 68 89 53 67 30 73 16 69 87 40 31 --)
      (04 62 98 27 23 09 70 98 73 93 38 53 60 04 23)))

(defun last-line-p (n)
  (eql n (1- (array-dimension *triangle* 0))))

(defun trig (line row)
  (aref *triangle* line row))

(defun state (sum line row)
  (list :sum sum :line line :row row))

(defun initial-state ()
  (state (trig 0 0) 0 0))

(defun next-states (state)
  (destructuring-bind (&key sum line row) state
    (unless (last-line-p line)
      (list (state (+ sum (trig (1+ line) (1+ row))) (1+ line) (1+ row))
            (state (+ sum (trig (1+ line) row)) (1+ line) row)))))

(defun collect-final-states (states)
  (let ((next (mapcan #'next-states states)))
    (if (null next)
        states
        (collect-final-states next))))

(defun euler018 ()
  (loop for state in (collect-final-states (list (initial-state)))
        maximize (getf state :sum)))

#+nil
(defun limit (start-line)
  (reduce #'+ (nthcdr start-line *triangle*)
          :key (lambda (line) (reduce #'max line))))
