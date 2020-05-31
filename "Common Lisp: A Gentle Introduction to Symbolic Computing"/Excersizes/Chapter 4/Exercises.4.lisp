;;;Ex.1
(defun make-even (num)
  (if (evenp num) num (+ num 1)))

;;;Ex.2
(defun further (x)
  (if (zerop x) x
    (if (> x 0) (+ x 1) (- x 1))))

;;;Ex.3
(defun my-not (x)
  (if x nil T))

;;;Ex.4
(defun ordered (x y)
  (if (> x y) (list y x) (list x y)))

;;;Ex.6
(defun my-abs (x)
  (cond ((> x 0) x)
    (t (- x))))

;;;Ex.8
(defun emphasize3 (x)
  (cond ((equal (first x) 'good) (cons 'great (rest x)))
    ((equal (first x) 'bad) (cons 'awful (rest x)))
    (t (cons 'very x))))

(emphasize3 '(very long day))

;;;Ex.9
(defun make-odd (x)
  (cond (t x)
    ((not (oddp x )) (+ x 1))))
;;;doesnt work because the first conditional blocks any further going down the chain

;;;;;;;;;correct
(defun make-odd (x)
  (cond ((not (oddp x )) (+ x 1))
    (t x)))

;;;Ex.10
;;;cond
(defun constraint (x min max)
  (cond
    ((> x max) max)
    ((< x min) min)
    (t x)
    ))
;;;if
(defun constraint (x min max)
  (if (> x max) max
    (if (< x min) min x)
   ))

;;;Ex.11
(defun firstzerop (lst)
  (cond
    ((equal 0 (car lst)) 'first)
    ((equal 0 (cadr lst)) 'second)
    ((equal 0 (caddr lst)) 'third)
    (t 'none)
   ))
;;;Ex.12
(defun cycle (x)
  (cond
    ((> x 98) 1)
    (t (+ x 1))
   ))

;;;Ex.13
(defun howcompute (x y z)
  (cond
    ((equal (+ x y) z) 'sum-of)
    ((equal (- x y) Z) 'diffrence-of )
    ((equal (/ x y) Z) 'quotient-of )
    ((equal (* x y) Z) 'product-of )
    (t 'beats-me)
   ))

;;;Ex.14
(or ’fee ’fie ’foe) => fee
(and ’fee ’fie ’foe) => foe
(or nil ’foe nil) => foe
(and ’fee ’fie nil) => nil
(and (equal ’abc ’abc) ’yes) => yes
(or (equal ’abc ’abc) ’yes) => T


;;;Ex.15
(defun geq (x y)
  (or (equal x y) (> x y)))

;;;Ex.16
(defun fnc (x)
  (cond
    ((and (oddp x) (> x 0)) (* x x))
    ((and (oddp x) (< x 0)) (* x 2))
    (t (/ x 2))
    ))

;;;Ex.17
(defun bog (sex age-group)
  (or
    (and(or (equal sex 'boy) (equal sex 'girl)) (equal age-group 'child))
    (and(or (equal sex 'man) (equal sex 'woman)) (equal age-group 'adult))
   ))

;;;Ex.18
(defun play (p1 p2)
  (cond
    ((equal p1 p2) 'tie)
    ((or
      (and (equal p1 'rock) (equal p2 'scissors))
      (and (equal p1 'scissors) (equal p2 'paper))
      (and (equal p1 'paper) (equal p2 'rock)))
      'player-one-wins)
      ('player-two-wins)))

;;;Ex.19
'(and x y z w)

'(cond
  ((not x) nil)
  ((not y) nil)
  ((not z) nil)
  (t w)
  )

'(if x
   (if y
      (if z w )))

;;;Ex.20

;;;with "if"
(defun compare (x y)
  (if (equal x y) 'they-are-equal
    (if (> x y) 'the-first-is-bigger 'the-second-is-bigger)))

;;;using "and" and "or"
(defun compare (x y)
  (or
   (and (equal x y) 'they-are-equal)
   (and (> x y) 'the-first-is-bigger)
   'the-second-is-bigger
   ))

;;;Ex4.21

;;;using cond
(defun gtest (x y)
  (cond
    ((equal x y) t)
    ((zerop x) t)
    ((zerop y) t)
    (t nil)
    ))

;;;using if
(defun gtest (x y)
  (if (equal x y) t
    (if (zerop x) t
      (if (zerop y) t nil))))

;;;Ex4.22
;;;cond version
(defun boilingp (temp scale)
  (cond
    ((equal scale 'fahrenheit) (> temp 211))
    ((equal scale 'celsius) (> temp 99))
    (t nil)
    ))

;;;if version
(defun boilingp (temp scale)
  (if (equal scale 'fahr) (> temp 211)
    (if (equal scale 'cels) (> temp 99) (nil))))

;;;and/or version
(defun boilingp (temp scale)
  (or
    (and (equal scale 'fahr) (> temp 211))
    (and (equal scale 'cels) (> temp 99))
   ))
;;;Ex.23
;;;where-is-cond (8 cond) = where-is-2-if (7 nested if) = where-is-3-and/or (1 or 7 and)
;;;if (1)
;;;(if (2)
;;;(if (3)
;;;(if (4)
;;;(if (5)
;;;(if (6)
;;;(if (7) (8)
;;;))

;;;Ex.24
;;;They allow branching in our programs

;;;Ex.25
;;;places nill as the third, an implied nill so to say

;;;Ex.26
;;;if can be nested

;;;Ex.27
;;;nil

;;;Ex.28
(or
  (and (oddp 4) ( evenp 7 ))
  (and (not (oddp 4)) 'foo)
 )

;;;Ex.29
(defun logical-and (x y)
  (if x
    (if y t)))

(defun logical-and-2 (x y)
  (cond
    ((not x) nil)
    ((not y) nil)
    (t t)
  ))

;;;Ex.30


(defun l-or-1 (x y)
  (not
    (if x t
      (if y t )
 )))

(defun l-or-2 (x y)
  (cond
    (x t)
    (y t)
    (t nil)
  ))

;;;Ex.31 It is already boolean because it only gives back t and nil
