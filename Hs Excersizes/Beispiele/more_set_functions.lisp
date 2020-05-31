;(setq "symbol" "value" or "symbol" "symbol" ...) Assign Multiple values in succession, the result is the last assign
( setq a 2 b 1) ; => 1
(a) ; => 2
(b) ; => 1
;(psetq "symbol" "symbol" or "symbol" "value") Assign multiple values in parallel, result is always NIL
( psetq a b b a )
(a) ; => 1
(b) ; => 2

;(setf "memory_adress" value) Assigns a value to a given Memory memory_adress
(setf a (cons 1 2))
(a); => (1 . 2)
(setf (car a ) 42)
(a) ; => (42 . 2)

;(defparameter "symbol" "value") Assigns a symbol a value, overwriting anything that was stored there beforehand
(defparameter a 22)
(a); => 22

;(defvar "symbol" "value") Assigns an uninitialized variable, a value. Does not work if the variable is already initialized
(defvar z 22)
 z ; => 22

;(let "symbol" "value") Assigns a variable a local value thats gonna be used for the block, but it does not exist outside of that.
(defun lets_have_fun (smth)
  (let ((x smth )
    (y (* smth 2)))
      (* x y)))

(defun lets_have_some_more_fun (smth)
  (let (( x smth )
    (y (* x 2)))
      (* x y)))

(lets_have_fun (2) ); => 8
(lets_have_some_more_fun (2) ) ; => Error: Varialbe x has no value

(defun arent_we_having_fun (smth)
  (let* (( x smth )
    (y (* x 2)))
      (* x y)))

arent_we_having_fun(2) ; => 8 Works because let* makes them visible to each other becuase they get assigned sequntually

( defun blow_my_mind ()
  ( let (( a 3 ) ( b 4 ))
    ( let (( a 5 ) ( c 6 ))
      (* a b c))))

(blow_my_mind) ; => 120 The inner "a" hides the outer "a"so the value 5 gets taken into account

(defun dynamico (argument)
  (declare (special argument)) ; "declare" , declares a "special" variable which is gonna undergo dynamic bynding
    (in_and_out))

(defun in_and_out ()
  (print argument))

(dynamico (2)) ; => 2 ; this works because of said dynamic binding,
                      ;  the compiler sees that argument is transcending
                      ;  the two functions and lets it exist there.
