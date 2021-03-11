(defun make-first-even (num)
    (if (evenp num) num (+ num 1)))

(defun make-abs-greater-num (num)
    (if (> num 0) (+ num 1) (- num 1)))

(defun make-asc-pair (a b)
    (if (> a b) (list a b) (list b a)))

(defun is-between (a b c)
    (if (< b a) (> c a) (< c a)))

(and 'fee 'fie 'foe)            ; FOE
(or 'fee 'fie 'foe)             ; FEE
(and (equal 'abc 'abc) 'yes)    ; YES
(or nil 'fie 'foe)              ; FIE
(and nil 'fie 'foe)             ; NIL
(or (equal 'abc 'abc) 'yes)     ; T

(defun is-ge (a b)
    (if (>= a b) T Nil))

(defun pred1 (x)
    (and (numberp x) (plusp x)))    ; Good

(defun pred2 (x)
    (and (plusp x) (numberp x)))    ; Error

;; IF variant
(defun is-between-if (a b c)
    (if (< b a) (> c a) (< c a)))
;; COND variant
(defun is-between-cond (a b c)
    (cond ((< b a) (> c a))
        (T (< c a))))
;; AND/OR variant
(defun is-between-andor (a b c)
    (or (and (< b a) (> c a)) (and (< c a) (> b a))))

;; COND variant
(defun how-alike-cond (x y)
    (cond ((or (= x y) (equal x y)) 'the_same)
    ((and (oddp x) (oddp y)) 'both_odd)
    ((and (evenp x) (evenp y)) 'both_even)
    (T 'difference)))
;; IF variant
(defun how-alike-if (x y)
    (if (if (= x y) (equal x y)) 'the_same (
        if (if (oddp x) (oddp y)) 'both_odd (
            if (if (evenp x) (evenp y)) 'both_even 'difference))))
;; AND/OR variant
(defun how-alike-andor (x y)
    (or (and (or (= x y) (equal x y)) 'the_same)
    (and (oddp x) (oddp y) 'both_odd)
    (and (evenp x) (evenp y) 'both_even)
    'difference))