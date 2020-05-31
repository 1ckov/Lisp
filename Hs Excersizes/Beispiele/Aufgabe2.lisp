;Aufgabe 1
;a
(defun berechnen (liste) 
(mapcar 
  #'(lambda (x) 
  (let* (
    (opp1 (car x)) 
    (opp2 (caddr x)) 
    (fun (cadr x)) 
    (res (apply fun (list opp1 opp2)))
    ) 
    (list opp1 fun opp2 '= res)))
    liste))

;b

(defun vzs (L) 
 (cond 
  ((null L) ())
  ((atom L) L)
  ((null (cdr L)) (mapcar 'vzs (car L)))
  ;((atom (car L)) )
  (T (mapcar 'vzs L ))))
  
(defun vzs (L)
(cond
((null L) ())
((atom L) L)
((atom (car L)) (vzs(car L)))
(T (list (vzs (car L)) (vzs (cdr L))))))


(defun vzs (L)
(condelim-neutrals
((null L) ())
((atom L) L)
((null (cdr L)) (vzs (car L)))
((atom (car L)) (vzs(car L)) (vzs(cdr L)))
(T (list (vzs(cdr L)) (vzs(car L))))))

(defun vzs (L)
(cond
((null L) ())
((atom L) L)
((null (cdr L)) (vzs (car L)))
((atom (car L)) (vzs(car L)) (vzs(cdr L)))
(T (list (vzs(cdr L)) (vzs(car L))))))


(defun vzs (L) (L
do* (
(firstList ())
(currentList (car L) (car remainingLists))
(remainingLists (cdr L) (cdr remainingLists))
(rows (length L) (- rows 1))) 
((= rows 0))
(setq firstList(cons firstList (car currentList)))))
;(format t "~% currentList = ~d" (car currentList))))

;Aufgabe 2
;a

(defun alist-keys (list)
 (mapcar 'car list))

(print(alist-keys '((d 3) (a 1) (b 7) (e 0))))



;b

(defun listenop (op liste1 liste2)
(apply op liste1  liste2))

(print(listenop 'list '(3 4)  '(((c d) (e f)))))
(print(listenop 'append '(3 4)  '(((c d) (e f)))))

;c
(defun deep-member (elem liste)

    (cond ((not liste) nil)
      ((equal elem (first liste)) T)
      ((consp (first liste)) (or (deep-member elem (first liste))
                              (deep-member elem (rest liste))))
      (t (deep-member elem (rest liste)))))

(print (deep-member 'd '(a b (c a d) e)))
(print (deep-member '(c a d) '(a (b (c a d)) e)))
(print (deep-member 'f '(a b c a d e)))




;d 
(defun verteilen (lst)
  (if (endp lst)
      '(nil nil)
      (let ((x (verteilen (cdr lst))))
         (if (numberp (car lst))
             (list (cons (car lst)
                        (car x)) (cadr x))
             (list (car x)
                   (cons (car lst) (cadr x)))))))

 (print(verteilen '(a 1 b 2 c 3 d 4)))


;e
(defun divfirst (list &optional head)
  (if head
      (if (null list)
          nil
        (cons (/ (first list) head)
              (divfirst (rest list) head)))
    (divfirst list (first list))))

(print(divfirst '(3 9 15 12 30)))


;f
(defun bilde-geordnete-Unterlisten (liste)
  (let (rek-result)
    (cond ((< (length liste) 2) (list liste))
          ((< (first liste) (second liste))
            (setq rek-result (bilde-geordnete-Unterlisten (rest liste)))
             (cons (cons (first liste) (first rek-result)) (rest rek-result)))
            (t
             (cons (list (first liste)) (bilde-geordnete-Unterlisten (rest liste)))))))

(print(bilde-geordnete-Unterlisten '(2 5 9 3 34 44 45 45 56 3 3 5 9 0)))


;g
(defun neut_elem (term)
  (cond ((equal '* (car term)) (remove 1 term))
        ((equal '+ (car term)) (remove 0 term))
        (t term)))

(defun struktur-aufloesen (term)
  (cond ((and (equal '* (car term)) (member 0 term)) 0)
        ((and (equal '* (car term)) (=2 (length term))) (second term))
        ((and (equal '+ (car term)) (=2 (length term))) (second term))
        ((and (equal '* (car term)) (=1 (length term))) 1)
        ((and (equal '+ (car term)) (=1 (length term))) 0)
        (t term)))

(defun vereinfache (term)
   (cond ((atom term) term)
         (t (struktur-aufloesen (neut_elem (mapcar 'vereinfache term))))))


(print (vereinfache (+ a(* (+ b (* 0 d) c) 1 3) 0)))