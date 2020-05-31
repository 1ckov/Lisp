; Aufgabe 1

; Teil 1

(defun endnote(pruefungsnote &optional vornote) 
    (if (null vornote) (return-from endnote pruefungsnote) 
      (if (> pruefungsnote vornote) (return-from endnote pruefungsnote) 
      (/ (+ pruefungsnote vornote) 2) ) ) )


; Teil 2

( defun endnote2 ( pruefungsnote &optional (vornote1 0) (vornote2 0 ))
  ( if ( and ( < pruefungsnote vornote1 ) ( < pruefungsnote vornote2) ) 
  ( / ( + pruefungsnote vornote1 vornote2 ) 3)
  ( return-from endnote2 pruefungsnote)
  ))
                
; Teil 3

(defun notendurchsnitt ( liste-von-noten &optional (bonus 0)) 
  (let ((sum 0) (count 0))
    (dolist (note liste-von-noten)
      (setq sum (+ sum note))
      (setq count (+ count 1)))
    (setq res (/ sum count))
    (if (< res 0.7) (setq res 0.7) 
    (if (< 0.7 (- res bonus)) (setq res (- res bonus)) (setq res 0.7) 
    ))
  
  )
  (format T "~% Middle: ~d " res )
)

; Teil 4 
(defun examnote (u-examnote &rest values) 
(let ((sum 0) (res 0) (length) (finalnote 0))
  (setq length (list-length values))
  (if (eq 0 length) () 
    (dolist (bonus-note values) 
      (setq sum (+ sum bonus-note))))
  (setq res (/ sum length))
  (if (eq length 1)
  (setq finalnote (+ (* u-examnote 0.9) (* res 0.1)))
  (if (eq length 2) 
  (setq finalnote (+ (* u-examnote 0.8) (* res 0.2)))
  (if (eq length 3) 
  (setq finalnote (+ (* u-examnote 0.7) (* res 0.3)))
  (if (eq length 4) 
  (setq finalnote (+ (* u-examnote 0.6) (* res 0.4)))
  (if (> length 4) 
  (setq finalnote (+ (* u-examnote 0.5) (* res 0.5)))
  (setq sfinalnote u-examnote))))))
  (format t "~%Final Note:~d With ~d bonusnotes" finalnote length)))

; Aufgabe 4
(defun mobilep (list) 
  (cond 
    ((null list) 0) 
    ((atom list) list)
    ((null (cdr list)) (car list))
    ((null (equal (mobilep (cadr list)) (mobilep (caddr list)))) nil)
    (T (+ (car list) 
      (mobilep (cadr list)) 
      (mobilep (caddr list))))))

(mobilep '(10 (11 (2 3 3) 8) (9 9 (1 (2 1 1) 4))))      
(print( mobilep '(10 (11 (2 3 3) 8) (9 9 (1 (2 1 1) 4)))))



  