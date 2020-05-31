;Lisps chain of calls
;1 is the variable a "Special Form"
;2 is the variable a "Macro"
;3 is the variable a "Function Descriptor"
;4 if none give back true => Error

;List Functions
;"Konstruktoren" (Bsp CONS, APPEND,LIST...)
;"Selektoren" (Bsp. CAR, CDR, FIRST, LAST)
;"Modifikatoren" (Bsp. SETF)
;"sonstige" (Bsp. LENGTH, MEMBER)

;Selfdefined Functions
;Named
;(defun "Name" ("Parameterlist/e") ("Rumpf"))

;Unnamed(lambdas)
;(lambda ("Parameterlist/e") "Rumpf")
;Lambda calls occur directly after definition in most cases
;((lambda ("Parameterlist/e") "Rumpf") "actueller parameter")

;Reggex Notation is used to discribe the Parameterlist
;"Parameterliste" of Lisp
;( {variable}* |
  ;{ [ &optional { variable | ( variable [ initform  [ svar ] ] ) } * ]
  ; bsp
  (defun hi ( var1 var2 &optional (a 2) (b (+ 2 2))) (write a ))
  (hi 2 3) ;=> 2
  ;[ &restvar ] ;Takes on all the non Formal Parameters that have been passed, its used to declare funtions with unscpecoified number of parameters

  ;[ &key { variable | ( { variable | { (keywordvar ) } [ initiform [ svar ] ] ) } * [ &allow-other-keys ] ]
  ( ( lambda ( &key vorname name  ( semester 1) ) ( list vorname name semester ) )
    :name 'peter :vorname 'herbert ) ; => (peter herbert 1)
  (defun test ( var1 var2 &key a b) (list var1 var2 a b))
  (test 2 3 :a 4 :b 5) ; => (2 3 4 5)
  ;[ &aux { variable | (varinitform] ) } * ]
;)

  ;Funktions as parameters
  (defun anwenden (funktion argumentenliste)
    (if (endp argumentenliste)
    ()
    (cons (funktion (first argumentenliste))
    (anwenden funktion (rest argumentenliste)))))
(anwenden 'first '(a b  d)) ;=> undefined argument funktion
;this happens because funktion is at the point of evaluateion a symbol and not a Function

(defun anwenden1 (funktion argumentenliste)
(if (endp argumentenliste)
()
(cons (funcall funktion (first argumentenliste))
(anwenden1 funktion (rest argumentenliste)))))

(anwenden1 'first '((a b c d) (b c d e))) ;=> (A B)

(defun anwenden2 (funktion argumentenliste)
(if (endp argumentenliste)
()
(cons (apply funktion (first argumentenliste))
(anwenden2 funktion (rest argumentenliste)))))

;this guy needs a list of list to work
(anwenden2 'first '(((a b c d) (b c d e)))) ;=> (A B)

;so that the user doesnt have to care what he is giving the function to we modify the code
(defun anwenden3 (funktion argumentenliste)
(if (endp argumentenliste)
()
(cons (apply funktion (list (first argumentenliste)))
(anwenden3 funktion (rest argumentenliste)))))

(anwenden3 'first '((a b c d) (b c d e))) ;=> (A B)

;flet functions that are valid only in the defined block
;labels does the same but can be recursevly called up

;Using a global variable to double our Value, drawback its accessible form outside
(setf *previous-power-of-two* 1)
(defun previous-power-of-two ()
  (setf *previous-power-of-two*
    (* *previous-power-of-two* 2) ) )
;doing the same using a lambda expression, still same problem
(setf (symbol-function 'power-of-two)
 #'(lambda () (setf *previous-power-of-two* (* *previous-power-of-two* 2 ))))

; this time the value only exist locally
; but now to spawn a second generator we need to copy paste the code

 (setf (symbol-function 'power-of-two)
  (let* ((previous-power-of-two 1))(setf generators 
  (let ((previous-power-of-two 1))
    (list 
      #' (lambda ()
          (setf previous-power-of-two 1))
      #' (lambda () 
          (setf res previous-power-of-two) 
          (setf previous-power-of-two 
          (* previous-power-of-two 2))
          res))))

(setf (symbol-function 'power-of-two-reset) (first generators))
(setf (symbol-function 'power-of-two-value) (second generators))
  #'(lambda () 
  (setf res previous-power-of-two)
  (setf previous-power-of-two 
  (* previous-power-of-two 2))
  res)))

(setf generators 
  (let ((previous-power-of-two 1))
    (list 
      #' (lambda ()
          (setf previous-power-of-two 1))
      #' (lambda () 
          (setf res previous-power-of-two) 
          (setf previous-power-of-two 
          (* previous-power-of-two 2))
          res))))

(setf (symbol-function 'power-of-two-reset) (first generators))
(setf (symbol-function 'power-of-two-value) (second generators))



  