(setf l '(a b c d))
(setf a 'a)

(defun my-if (arg) 
  cond ((listp arg) (car arg))
  (T (nil))
)
(defun my-if (test then-fall else-fall)
  (cond (test then-fall)
    (t else-fall))
)
;(setf a 'a)
;(my-if (listp a) (car a) nil)
; --> Auswertung der Parameter my-if:
;   (listp 'a)
;   (car 'a) ==> Fehler bei der Ausswertung

(defmacro demo-macro (par) (print par))

(defun demo-fun (par) (print par))

(setf p 'WertVonP)

(demacro my-if-m (test then-fall else-fall)
  (cond (test then-fall)
    (t else-fall))
)
;(setf a 'a)
;(macroexpand '(my-if-m (listp a) (car a) nil))
(defmacro subst-pair (pair)
  (list 'second pair)
)



