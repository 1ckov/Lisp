;Ex.1
;;;The second cond clause never gets satisfied

;;;Ex.2
(defun anyoddp (x)
  (if (null x) nil
    (if (oddp (first x)) t (anyoddp (rest x)))))

;;;MY FACT
(defun fact (x)
  (if (zerop x) 1 (* x (fact (- x 1)))))
(fact 5) => 120
;;;.3 Diffrent notation, but zero looks the same in both

;;;my cut slices
(defun cut-slices (x)
  (if (null x) 0 (+ 1 (cut-slices (rest x)))))

(cut-slices '(a b c d e 2 3 5 6 1))

;;;Ex.4
(Defun laugh (x)
       (cond
         ((zerop x) nil)
         (t (cons 'ha (laugh (- x 1))))
         ))

;;;Ex.5
(defun add-up (x)
  (if (null x) 0 (+ (car x) (add-up (rest x)))))

;;;Ex.6
(defun alloddp (x)
  (cond
        ((null x) t)
        ((evenp (car x) ) nil)
        (t (alloddp (rest x)))
  ))
(alloddp '(1 3 5))

;;;Ex.7
(defun rec-member (x lst)
  (cond
    ((null lst) nil)
    ((equal x (car lst)) lst)
    (t (rec-member x (rest lst)))
  ))

;;;Ex.8
(defun rec-assoc (x lst)
  (cond
    ((null lst) nil)
    ((equal x (caar lst)) (car lst))
    (t (rec-assoc x (rest lst)))
 ))
(rec-assoc 'x '((x a) (a . x) (a a)))
;;;Ex.9
(defun rec-nth (x lst)
  (cond
      ((zerop x) (car lst) )
      (t (rec-nth (- x 1) (rest lst)))
    ))

;;;Ex.10
(defun add1 (x) (+ x 1))
(defun sub1 (x) (- x 1))
(defun rec-plus (x y)
  (cond
    ((zerop (sub1 y)) (add1 x))
    (t (rec-plus (add1 x) (sub1 y)))
    ))

;;;Ex.11
(defun fib (x)
     (cond
       ((zerop x) 1)
       ((equal x 1) 1)
       (t (+ (fib (- x 1)) (fib (- x 2))))
       ))
(fib 5) => 8

;;;Ex.12
;;; '(2 3 4 7) => t
;;;() => infinite loop

;;;Ex.13 Any negative integer

;;;Ex.14
(defun shortest-infinite-recursion ()
  (cond (t (shortest-infinite-recursion))))

;;;Ex.15
;;;car => x
;;;cdr => (x . itself)
;;;count-slices will go in an infinite loop

;;;Ex.16 Open it up for errors

(defun anyoddp (x) ; (defun func (x)
  (cond
        ((oddp (first x)) t)  ; (end-test-2 return-value-2)
        ((null x) nil) ; (end-test-1 return-value-1)
        (t (anyoddp (rest x)))  ; (t (func reduced-x))
    ))

;;;Ex.17
;;Double test tail reccursion
(defun anyoddp (x) ; (defun func (x)
  (cond
        ((null x) nil) ; (end-test-1 return-value-1)
        ((oddp (first x)) t)  ; (end-test-2 return-value-2)
        (t (anyoddp (rest x)))  ; (t (func reduced-x))
    ))


(defun find-first-odd (x) ; (defun func (x)
     (cond
     ((null x) nil) ; (end-test-1 return-value-1)
     ((oddp (first x)) (first x))  ; (end-test-2 return-value-2)
     (t (find-first-odd (rest x)))  ; (t (func reduced-x))
      ))

;;;:Ex.18
(defun last elem (x)
(cond ((atom (cdr x)) (car x))
  (t (elem (rest x )))
 ))

;;;Ex.19
;;;NOnempty list that have an odd number
;;;for all other lsit it would throw an error

;;;Ex.20 single test augmentation recursion
(defun fact (x) ; (defun func (x)
;;; (if (end-test) end-value (aug-fn auf-value (func reduced-x))))
  (if (zerop x) 1 (* x (fact (- x 1)))))

;;;Ex.21
(defun addnums (n)
  (cond
    ((zerop n) 0)
    (t (+ n (addnums (- n 1))))
   ))

;;;Ex.22 double test tail reccursion
(defun all-equal (x)
  (cond
        ((null x) t)
        ((not (equal (car x) (cadr x))) nil)
        (t (all-equal (cdr x)))
  ))
;;;Ex.24
(defun counting-down (n)
  (cond
      ((zerop n) nil)
      (t (cons n (counting-down (- n 1))))
    ))
;;;Ex.25 Using it and reduce

;;;Ex.26
(defun counting-down (n)
  (cond
      ((equal -1 n) nil)
      (t (cons n (counting-down (- n 1))))
    ))

;;;Ex.27
(defun square-list (x)
  (cond
      ((null x) nil)
      (t (cons (* (car x) (car x)) (square-list (rest x))))
    ))

;;;(DEFUNfunc(N X)(COND (end-test  end-value)(T (func  reduced-n  reduced-x))))
;;;Ex.28
(defun my-nth (n x)
  (cond
    ((null x) nil)
    ((zerop n) (first x))
    (t (my-nth (- n 1) (rest x)))))

;;;Ex.31
(defun compare-lengths (x y)
  (cond
    ((and (null x) (null y) )same-length)
    ((null x ) 'second-is-longer)
    ((null y ) 'first-is-longer)
        (t (compare lengths (rest x) (rest y)))
    ))

;;;Ex.38
(defun atoms-to-q (x)
  (cond
        ((null x) nil)
        ((atom x) 'q)
        (t (cons (atoms-to-q (car x))
                 (atoms-to-q (cdr x))))))
;;;Ex.39
(defun count-atoms (x)
  (cond ((atom x) 1)
        (t (+ (count-atoms (car x))
                 (count-atoms (cdr x))))))

(defun count-cons (x)
  (cond
      ((atom x) 0)
      (t (+ 1 (+ (count-cons (car x) )( count-cons (cdr x)))))
))
