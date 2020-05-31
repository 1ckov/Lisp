;;;Ex.1
;;;This is a comment outside a functio body
(defun good-style (p)
  (let ((q (+ p 5))) ; This is a comment thats on the same line as code
    ;; This is a comment inside a function body
    (list 'result 'is q)
    ))

;;;Ex.2
;;;when a function does more than just return a vlaue, for instance, if it also changes the value of the givin variable
;;;
;;;Ex.3
;;;local varialbes exist in a given scope and can only be called from there, global ones exist in the global scope of things
;;;and can be called anywhere

;;;Ex.4
;;;So it does not evaluate the value of the first given argument, which is the name of the expression
;;;Exmpl. (setf a (+ 1 2)) => would give an error if it this wasnt the case
;;;And it would have to look like this (setf 'a (+ 1 2))

;;;Ex.5
;;;yes

;;;Ex.6

;;; a
(defun throw-die () "When called, returns a random number from 1 to 6 inclusively."
  (let ((throw (+ (random 6) 1)))
    throw ))
;;;(documentation 'throw-die 'function) => "When called, returns a random number from 1 to 6 inclusively."

;;; b
(defun throw-dice () "When called, returns 2 random number from 1 to 6 inclusively, each representing a die throw."
  (let ((throw-1 (throw-die))
        (throw-2 (throw-die)))
    (list throw-1 throw-2)
    ))
;;;(documentation 'throw-dice 'function) => "When called, returns 2 random number from 1 to 6 inclusively, each representing a die throw."

;;; c
(defun snake-eyes-p (throw) "Takes a list of two throws, and returns true if both values are 1"
  (let ((throw-1 (car throw)) (throw-2 (cadr throw)))
   (if (equal 1 throw-1) (equal 1 throw-2))
   ))

 (defun boxcars-p (throw) "Takes a list of two numbers, and returns true if both values are 6"
     (let ((throw-1 (car throw)) (throw-2 (cadr throw)))
      (if (equal 6 throw-1) (equal 6 throw-2))
      ))

;;; d
(defun instant-win-p (throw) "Takes an input of two numbers, and returns T if input is equal to 7 or 11"
  (let* ((throw-1 (car throw))
        (throw-2 (cadr throw))
        (result (+ throw-1 throw-2)))
    (if (equal result 7) t (equal result 11))
    ))

(defun instant-loss-p (throw) "Takes an input of two numbers, and returns T if input is equal to 2, 3 or 12"
  (let*
    ((throw-1 (car throw))
    (throw-2 (cadr throw))
    (result (+ throw-1 throw-2)))
      (or
       (equal result 2)
       (equal result 3)
       (equal result 12))))
;;; e
(defun say-throw (throw) "Takes a throw(a list of two numbers) as input, and either returns snake eyes(1 1), boxcars(6 6), or the value itself"
  (cond
    ((snake-eyes-p throw) 'snake-eyes)
    ((boxcars-p throw) 'boxcars)
    (t (+ (car throw) (cadr throw)))
  ))

;;; f
(defun craps ()
  (let*
    ((cur-throw (throw-dice))
    (die-1 (car cur-throw))
    (die-2 (cadr cur-throw))
    (result (say-throw cur-throw))
    (messege (cond
      ((instant-win-p cur-throw) (list result '-- 'you 'win))
      ((instant-loss-p cur-throw) (list result '-- 'you 'lose))
      (t (list 'your 'point 'is (+ die-1 die-2)))
    )))
    (cons 'throw (cons die-1 (cons 'and (cons die-2 (cons '-- messege)))))
    ))

;;; e
(defun try-for-point (p)
  (let*
    ((cur-throw (throw-dice))
    (die-1 (car cur-throw))
    (die-2 (cadr cur-throw))
    (result (+ die-1 die-2))
    (messege
      (cond
       ((equal p result) (list result '-- 'you 'win))
       ((equal 7 result) (list result '-- 'you 'lose))
       (t (list result '-- 'try 'again))
       )))
  (cons 'throw (cons die-1 (cons 'and (cons die-2 (cons '-- messege)))))
   ))
