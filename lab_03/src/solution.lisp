(equal 3 (abs -3))
(equal (+ 1 2) 3)
(equal (* 4 7) 21)
(equal (* 2 3) (+ 7 2))
(equal (- 7 3) (* 3 2))
(equal (abs (- 2 4)) 3)

(defun make-hypot (x y)
    (sqrt (+ (* x x) (* y y))))

(defun make-par-volume (x y z)
    (* x y z))

(list 'a 'b c)                  ; THE VARIABLE C IS UNBOUND
(cons 'a (b c))                 ; THE VARIABLE C IS UNBOUND
(cons 'a '(b c))                ; (A B C)
(caddr (1 2 3 4 5))             ; INVALID FUNCTION CALL
(cons 'a 'b 'c)                 ; INVALID NUMBER OF ARGUMENTS
(list 'a (b c))                 ; THE VARIABLE C IS UNBOUND
(list a '(b c))                 ; THE VARIABLE A IS UNBOUND
(list (+ 1 '(length '(1 2 3)))) ; (LENGTH '(1 2 3)) is not of type NUMBER

(defun is-longer-than (l1 l2)
    (> (length l1) (length l2)))

(cons 3 (list 5 6))                             ; (3 5 6)
(list 3 'from 9 'gives (- 9 3))                 ; (3 FROM 9 GIVES 6)
(+ (length '(1 foo 2 too)) (car '(21 22 23)))   ; 25
(cdr '(cons is short for ans))                  ; (IS SHORT FOR ANS)
(car (list one two))                            ; VARIABLE ONE IS UNBOUND
(cons 3 '(list 5 6))                            ; (3 LIST 5 6)
(car (list 'one 'two))                          ; ONE

(defun mystery (x)
    (list (second x) (first x)))
(mystery '(one two))        ; (TWO ONE)
(mystery 'free)             ; The value FREE is not of type LIST
(mystery (last 'one 'two))  ; The value ONE is not of type LIST when binding LIST
(mystery 'one 'two)         ; INVALID NUMBER OF ARGUMENTS: 2