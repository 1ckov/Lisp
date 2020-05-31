;;;Ex.1

(defun add1 (x) (+ x 1))
(mapcar #'add1 '(1 3 5 7 9))

;;;Ex.2
(setf daily-planet '((olsen jimmy 123-76-4535 cub-reporter)
 (kent clark 089-52-6787 reporter)
 (lane lois 951-26-1438 reporter)
 (white perry 355-16-7439 editor)))
(mapcar #'caddr daily-planet)

;;;Ex.3
(mapcar #'zerop '(2 0 3 4 0 -5 -6))

;;;Ex.4
(defun g-t-f-p (x) (> x 5))
(mapcar #'g-t-f-p '(2 0 3 4 0 -5 -6))

;;;Ex.5
#'(lambda (n) (- n 7))

;;;Ex.6
#'(lambda (n) (or (equal n t) (equal n nil)))

;;;Ex.7
(mapcar #'(lambda (n) (cond
                        ((equal n 'up) 'down)
                        (t 'up)
                        ))
'(up down down up up down))

;;;Ex.8
(defun roughly-equal (x k)
  (find-if #'(lambda(n) (and (< (- k n) 11) (> (- k n) -11))) x)
  )

;;;Ex.9
(defun find-nested (lst)
  (find-if #'(lambda (n) (and (listp n) (not (equal nil n)))) lst))

;;;Ex.10
;;;a

(setf note-table '(
  (c . 1)
  (c-sharp . 2)
  (d . 3)
  (d-sharp . 4)
  (e . 5)
  (f . 6)
  (f-sharp . 7)
  (g . 8)
  (d-sharp . 9)
  (a . 10)
  (a-sharp . 11)
  (b . 12)
  ))

;;;b
(defun numbers (lst)
  (mapcar #'(lambda (x) (cadr(assoc x note-table))) lst)
)
(numbers '(e d c d e e e))

;;;c
(defun notes (lst)
  (mapcar #' (lambda (n) (car (rassoc n note-table))) lst ))
(notes '(5 3 1 3 5 5 5))

;;;my own version
(setf note-table '(
  (c  1)
  (c-sharp  2)
  (d  3)
  (d-sharp  4)
  (e  5)
  (f  6)
  (f-sharp  7)
  (g  8)
  (d-sharp  9)
  (a  10)
  (a-sharp  11)
  (b  12)
  ))

(defun my-search (elemnt table)
  (find-if #'(lambda (x) (equal elemnt (cadr x))) table))

(defun notes (lst)
  (mapcar #'(lambda (x) (car (my-search x note-table))) lst))
(notes '(5 3 1 3 5 5 5))

;;;d both of them will return nil lists

;;;e
(defun raise (n lst)
  (mapcar #'(lambda (x) (+ n x)) lst))

(raise 5 '(5 3 1 3 5 5 5))

;;;f
(defun normalize (lst)
  (mapcar #'(lambda (n) (cond ((> n 12) (- n 12))
                              ((< n 1) (+ n 12))
                              (t n)
                               )) lst )
)
(normalize '(6 10 13))

;;;g
(defun transpose (n song)
  (notes (normalize (raise n (numbers song))))
)

;;;Ex.11
(defun my-remove (lst)
  (remove-if-not #'(lambda (x) (and (> x 1) (< x 5)) ) lst))
(my-remove '(1 2 3 4 5 6 2 2 3 4))

;;;Ex.12
(defun the-counter (lst)
  (length (remove-if-not #'(lambda (x) (equal 'the x)) lst)))
(the-counter '(the the the a b c))

;;;Ex.13
(defun l-2 (x)
  (remove-if #'(lambda (x) (equal 2 (length x))) x))
(l-2 '((a b) (b) (d) (a b c d)))

;;;Ex.14
(defun my-intersection (x y)
  (remove-if-not #'(lambda (n) (member n y)) x))

(defun my-union (x y)
  (append y (remove-if #'(lambda (n) (member n y)) x )))

;;;Ex.15
;;;a
(defun rank (x) (car x))
(defun suit (x) (cadr x))

;;;b
(setf my-hand '(
  (3 hearts)
  (5 clubs)
  (2 diamonds)
  (4 diamonds)
  (ace spades)
))

(defun count-suits (cur-suit cur-hand)
  (length(remove-if-not #'(lambda (x) (equal cur-suit (suit x))) cur-hand)))
(count-suits 'diamonds my-hand)
;;;c
(setf colors '(
                (clubs black)
                (diamonds red)
                (hearts red)
                (spades black)
               ))
(defun color-of (lst)
  (cadr (assoc (suit lst) colors)))
(color-of '(2 clubs))

;;;d
(defun first-red (lst)
  (find-if #'(lambda (x) (equal 'red (color-of x))) lst))

(first-red my-hand)

;;;e
(defun black-cards (lst)
  (remove-if-not #'(lambda (x) (equal 'black (color-of x))) lst))
(black-cards my-hand)

(defun what-ranks (cur-suit hand)
  (mapcar #'rank (remove-if-not #'(lambda (x) (equal cur-suit (suit x))) hand) ))
(what-ranks 'diamonds my-hand)
;;;h
(setf all-ranks '(2 3 4 5 6 7 8 9 10 jack queen king ace))

(defun higher-rank-p (card-1 card-2)
  (let ((rank-1 (rank card-1))
        (rank-2 (rank card-2))
        )
        (< (length (member rank-1 all-ranks)) (length (member rank-2 all-ranks)))

    ))
(higher-rank-p '(2 clubs) '(4 diamonds))

;;;h
(defun high-card (x)
  (find-if #'(lambda (n) (assoc n x)) (reverse all-ranks)))
(high-card my-hand )

;;;Ex.16
(reduce #'union '((a b c) (c d a) (f b d) (g)))
(C A F B D G)

;;;Ex.17
(length(reduce #'append '((a b c) (e f g))))

;;;Ex.18 because when called with empty parameters + gives back 0 and * gives back 1

;;;Ex.24
;;;an operator that applies on every argument of a given listp

;;;Ex.25
;;;They are so important becasue you can specify your function in the body of another ones
;;;Yes we would jsut have to sue defun more often

;;;Ex.26
(defun my-find-if (lst lamb)
  (first (remove-if-not lamb lst)))
(my-find-if '(a b c d) #'(lambda (x) (equal 'c x)))
;;;Ex.30
(setf words '((one un)
              (two deux)
              (three trois)
              (four quatre)
              (fire cinq)))

(defun make-greater-than-predicate (n)
  #'(lambda (x) (> x n)))
(setf pred (make-greater-than-predicate 3))
(funcall pred 2) ;=> nil
(find-if pred '(2 3 4 5 6 7 8 9)) ;=> 4
