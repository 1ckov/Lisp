;; c
(defun myfun (a b)
  (cons (cons a nil) (cons b nil)))
(myfun 'alpha 'beta)
;; d
(defun firstp (smbl lst)
  (equal smbl (car lst)))
(firstp 'foo '(foo bar baz))
(firstp 'foo '(foo bar baz))
;; e
(defun mid-add1 (lst)
  (list (car lst) (+ 1 (cadr lst)) (caddr lst) ))
(mid-add1 '(Hi 2 Me))
;; f
(defun f-to-c (temp)
  (/ (* 5 (- temp 32) ) 9.0))
(f-to-c 1)
