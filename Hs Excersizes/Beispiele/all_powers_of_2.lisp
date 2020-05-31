(defun print-quadratzahlen (x) 
  (when (plusp x) 
    (print (* x x)) 
      (print-quadratzahlen (- x 1 ))))
