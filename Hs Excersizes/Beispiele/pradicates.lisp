(eq x y) ; identisches Objekt (gleiche Speicheradresse)?
(eql x y) ; gleiche Zahl / identisches Objekt?
(equal x y) ; Sturkturgleichheit/ gleicher Lisp-Ausdruck?
(= x y); gleiche Zahl?
(not x) ; Negation von x
(atom x) ; x Atom?
(numberp x) ; ist x vom Typ number? analog: integerp, floatp,;; realp, rationalp, complexp, characterp, ; stringp,...
(evenp x) ; x gerade? analog: oddp
(consp l) ; ist l eine zusammengesetzte Liste
(null l) ; ist l die leere Liste 
(listp l) ; ist l eine Liste (vom Typ list)?
(member a l) ; ist a ein Element der Liste l?