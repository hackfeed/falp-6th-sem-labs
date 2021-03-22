(defun make-mult-lst-nums (lst init)
    (mapcar #'(lambda (el) (* el init)) lst))
(defun make-mult-lst-els (lst init)
    (mapcar #'(lambda (el) (cond ((listp el) (make-mult-lst-nums el init))
                            ((numberp el) (* el init))
                            (T el))) lst))

(defun flatten (lst)
    (cond ((null lst) Nil)
    ((atom lst) (list lst))
    (T (mapcan #'flatten lst))))
(defun make-mult-lst-els-rec (lst init)
    (flatten (cond ((null lst) Nil)
        ((numberp lst) (* lst init))
        ((symbolp lst) lst)
        (T (cons (make-mult-lst-els-rec (car lst) init) (make-mult-lst-els-rec (cdr lst) init))))))

(defun make-select-between (lst l r)
    (sort (reduce #'(lambda (acc el) (if (and (> el l) (< el r))
                                    (cons el acc)
                                    acc)) 
                                    lst :initial-value ()) 
    #'<))

(defun make-map (mapper lst)
    (mapcan #'(lambda (el) 
        (cond ((listp el) (and (consp (make-map mapper el)) (list (make-map mapper el))))
        (T (funcall mapper el))))
    lst))
(defun make-select-between-str (lst l r)
    make-map #'(lambda (el) (and (numberp el) (< el r) (> el l) (list el)) lst))

(mapcar 'bektop '(570-40-8))    ; The function COMMON-LISP-USER::BEKTOP is undefined.

(defun make-minus-10 (lst)
    (mapcar #'(lambda (el) (cond ((numberp el) (- el 10))
                            (T el))) lst))

(defun make-first-from-sublst (lst)
    (cond ((null lst) Nil)
    ((listp (car lst)) (caar lst))
    (T (make-first-from-sublst (cdr lst)))))

(defun make-sum-lst-nums (lst)
    (reduce #'(lambda (acc el) (cond ((listp el) (+ acc (make-sum-lst-nums el)))
                                ((numberp el) (+ acc el))
                                (T acc))) (cons 0 lst)))
