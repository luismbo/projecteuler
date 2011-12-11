(defun leap-year-p (year)
  (and (zerop (mod year 4))
       (or (not (zerop (mod year 100)))
           (zerop (mod year 400)))))

(defun days-in-month (month year)
  (case month
    ((2) (if (leap-year-p year) 29 28))
    ((4 6 9 11) 30)
    (t 31)))

;; January 1st 1901 is a Tuesday.
(defun euler019 ()
  (loop with year = 1901
        with month = 1
        for weekday in '#1=(tue wed thu fri sat sun mon . #1#)
        for day = 1 then (cond ((eql day (days-in-month month year))
                                (incf month)
                                (when (> month 12)
                                  (incf year)
                                  (setf month 1))
                                1)
                               (t
                                (1+ day)))
        until (eql year 2001)
        when (and (eql day 1)
                  (eq weekday 'sun))
          sum 1))
