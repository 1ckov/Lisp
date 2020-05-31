;;;Ex.1
;;;because the cdr of nil is nill

;;;Ex.2
;;; D because its a dotted list, ergo the last pointer(3rd points to d and not to nil)

;;;Ex.3
(last '(rosebud))
;;; rosebud

;;;Ex.4
(last '((a b c)))
;;; (a b c) because it looks only at teh top level elements of a list

;;;Ex.5
(setf line '(roses are red))
(reverse line) ; => (RED ARE ROSES)
(first (last line)) ; => red
(nth 1 line) ;=> are
(reverse (reverse line)) ;=> (roses are red)
(append line (list (first line))) ;=> (roses are red roses)
(append (last line) line) ;=> (red roses are red)
(list (first line) (last line)) ;=> (roses (red))
(cons (last line) line) ;=> ((red) roses are red)
(remove 'and line) ;=> (roses red)
(append line '(violets are blue)) ;=> (roses are red violets are blue)

;;;Ex.6
;;;using last
(defun last-elem (lst)
  (car (last lst)))
;;;using reverse
(defun last-elem-2 (lst)
  (car (reverse lst)))
;;;using nth()
(defun last-elem-3 (lst)
  (nth (- (length lst) 1) lst))

;;;Ex.7
;;;using reverse
(defun next-to-last (lst)
  (cadr (reverse lst)))
;;;using nth
(defun next-to-last-2 (lst)
  (nth (- (length lst) 2) lst))

;;;Ex.8
(defun my-butlast (lst)
  (reverse (cdr (reverse lst))))

;;;Ex.9
;;; car

;;;Ex.10
(defun palindromep (lst)
  (let
    ((n-elem (length lst))
     (first-elem (car lst))
     (last-elem (car (last lst)))
     )
    (cond
      ((equal n-elem 1) t)
      ((equal n-elem 2) (equal first-elem last-elem))
      ((equal first-elem last-elem) (palindromep (reverse (cdr (reverse (cdr lst))))))
      (t nil)
      )
    ))

;;;answers version
(defun palindromp (lst)
  (equal x (reverse x)))

;;;Ex.11
(defun make-palindrome (lst)
  (append lst (reverse lst)))

;;;Ex.12
;;;No because it only returns part of the list, without changing the contents

;;;Ex.13
;;; NIL

;;;Ex.14
;;;Itself

;;;Ex.15
(defun contains-article-p (lst)
  (intersection '(the a an) lst))
(defun contains-article-p (lst)
  (or (member 'the lst) (member 'a lst) (member 'an lst)
   ))
;;;and would not work because they would all have to be part of the list for it to work


;;;Ex.16
;;;itslef

;;;Ex.17
;itself

;;;Ex.18
(defun add-vowels (lst)
  (union '(a e i o u) lst))

;;;Ex.19
;;;itself

;;;Ex.20
;;;the first one because it is the one that gets changed

;;;Ex.21
(defun my-subset (x y)
  (equal nil (set-difference x y)))

;;;Ex.22 a = (soap water)
;;;=> (no soap radio water)
;;;=>(soap water)
;;;=>(soap)
;;;=>(nil)
;;;=>(soap water)
;;;=>(water)
;;;=>nil

;;;Ex.23
;;;length

;;;Ex.24
(defun set-equal (x y)
  (and (subsetp x y) (subsetp y x)))

;;;Ex.25
(defun proper-subsetp (x y)
  (and (subsetp x y) (not (subsetp y x))))

;;;Ex.26 (large red shiny cube -vs- small shiny red four-sided pyramid)
;;;a
(defun right-side (lst)
  (rest (member '-vs- lst)))

;;;b
(defun left-side (lst)
  (reverse (rest (member '-vs- (reverse lst)))))

;;;c
(defun common (lst)
  (let
    ((left-side (left-side lst))
     (right-side (right-side lst)))
    (length (intersection left-side right-side))
    ))

;;;d
(defun compare (lst)
  (cons (common lst) '(common features)))

;;;e Test expression
 (compare '(small red metal cube -vs- red plastic small cube))

;;;Ex.27
;;;yes because it returns nil for false results and all other values are true

;;;Ex.28
(setf produce '((apple . fruit)
                (celery . veggie)
                (banana . fruit)
                (lettuce . veggie)
                ))
(assoc 'banana produce) ;=> (banana . fruit)
(rassoc 'fruit produce) ;=> (apple . fruit)
(assoc 'lettuce produce) ;=> (lettuce . veggie)
(rassoc 'veggie produce) ;=> (celery . veggie)

;;;Ex.29 - length
(length '(a b c d))

;;;Ex.30
(setf books '(
              (the-dark-half stephen-king)
              (trainspoting irvine-welsh)
              (the-call-of-cthulhu h-p-lovecraft)
              (mort terry-pratchett)
              (a-clockwork-orange anthony-burgess)
              ))
;;;Ex.31
(defun who-wrote (name)
  (cadr(assoc name books))
  )
(who-wrote 'mort)

;;;Ex.32 The same
(setf books (reverse books))
(who-wrote 'mort)

;;;Ex.33
;;;No because assoc only looks at the car of table entry and not further
;;;We would have to either re order it like this (author-name book-name)

;;;Ex.34
'((pennsilvania pittsubrgh johnstown)
  (ohio columbus)
  (new-jersey trenton princeton newmark))

;;;Ex.35

;;;a
(setf nerd-states '(
                    (sleeping eating)
                    (eating waiting-for-a-computer)
                    (waiting-for-a-computer programming)
                    (programming debugging)
                    (debugging sleeping)
                    ))
;;;b
(defun nerdus (state)
  (cadr(assoc state nerd-states)
   ))

;;;c
(nerdus 'playing-guitar) ; => nil

;;;d
(defun sleepless-nerd (state)
  (if (equal state 'debugging) (nerdus 'sleeping) (nerdus state)))

;;;e
(defun nerd-on-caffeine (state)
  (nerdus (nerdus state)))

;;;f
;;;2 more
;;;(nerd-on-caffeine 'programming)
;;;SLEEPING
;;;(nerd-on-caffeine 'sleeping)
;;;WAITING-FOR-A-COMPUTER
;;;(nerd-on-caffeine 'waiting-for-a-computer)
;;;DEBUGGING

;;;Ex.36
(defun swap-first-last (x)
  (let*
   ((first-of (car x))
    (last-of (car (last x)))
    (rest-of (rest (reverse (rest x))))
    )
    (cons last-of (reverse (cons first-of rest-of)))))

;;;Ex.37
(defun rotate-left (x)
  (reverse (cons (car x) (reverse (rest x)))))

(defun rotate-right (x)
    (append (last x) (reverse (rest (reverse x)))))

;;;Ex.38
('(a b c) '(c b a))

;;;Ex.39
;;;append

;;;Ex.40
'((a b c d)
  (b c d)
  (c d)
  (d)
)

;;;Ex.42 '(if i learn lisp i will be pleased)
(defun royal-we (x)
  (subst 'we 'i x))
