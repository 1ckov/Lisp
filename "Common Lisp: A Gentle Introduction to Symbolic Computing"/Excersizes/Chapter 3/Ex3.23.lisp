;;;DOUBLE
;λx.(x*2)
(lambda (x) (* x 2))
((lambda (x) (* x 2)) 2) ;=> 4
;;;SQUARE
;λx.(x*x)
(lambda (x) (* x x))
((lambda (x) (* x x)) 2) ;=> 4
;;;HALF
;λx.(x/2)
(lambda (x) (/ x 2))
((lambda (x) (/ x 2)) 2) ;=> 1
;;;ONEMOREP
;λ(x,y).(x == (y+1))
(lambda (x y) (equal x (+ y 1)))
((lambda (x y) (equal x (+ y 1))) 7 6) ;=> T
