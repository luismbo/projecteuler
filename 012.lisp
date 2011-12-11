;;;; Trivial COUNT-DIVISORS (too slow)

(defun trivial-count-divisors (n)
  (if (eql n 1)
      1
      (loop for div from 1 upto n
            when (zerop (mod n div))
              sum 1)))

;;;; Sufficiently smart COUNT-DIVISORS

(defun better-count-divisors (n)
  (if (eql n 1)
      1
      (let ((sqrt (floor (sqrt n))))
        (+ (loop for div from 1 upto sqrt
                 when (zerop (mod n div))
                   sum 2)
           (if (eql (* sqrt sqrt) n) -1 0)))))

;;;; COUNT-DIVISORS using prime factorization

(defun primes<= (n)
  (loop with sieve = (make-array (1+ n) :initial-element t)
        for p from 2 upto n
        when (aref sieve p)
          do (loop for i from (expt p 2) upto n by p
                   do (setf (aref sieve i) nil))
          and collect p))

(defparameter *primes* (coerce (primes<= 65500) 'vector))

(defun count-divisors (n)
  (loop with prime-index = 0
        with total = 1
        with current-count = 0
        with remaining-n = n
        for p = (aref *primes* prime-index)
        while (<= p remaining-n)
        do (cond ((zerop (mod remaining-n p))
                  (incf current-count)
                  (setf remaining-n (/ remaining-n p)))
                 (t
                  (incf prime-index)
                  (setf total (* total (1+ current-count)))
                  (setf current-count 0)))
        finally (return (* total (1+ current-count)))))

;;;; Testing COUNT-DIVISORS

(defun test-count-divisors ()
  (equal (print (mapcar #'count-divisors (loop for i from 1 below 30 collect i)))
         '(1 2 2 3 2 4 2 4 3 4 2 6 2 4 4 5 2 6 2 6 4 4 2 8 3 4 4 6 2)))

;;;; Trivial Answer

(defun trivial-euler012 (&optional (n-divisors 500))
  (loop for i from 1
        for trig = 1 then (+ trig i)
        when (> (count-divisors trig) n-divisors)
          do (return trig)))

;;;; Neater Answer

(defun triangular-number (n)
  (/ (* n (1+ n)) 2))

(defun euler012 (&optional (n-divisors 500))
  (loop for i from 1
        when (> (count-divisors (triangular-number i)) n-divisors)
          do (return (triangular-number i))))
