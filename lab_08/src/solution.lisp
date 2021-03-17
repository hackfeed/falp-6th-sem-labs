(defun make-mult-lst-nums (lst init)
    (mapcar #'(lambda (el) (* el init)) lst))
(defun make-mult-lst-els (lst init)
    (mapcar #'(lambda (el) (cond ((listp el) (make-mult-lst-nums el init))
                            ((numberp el) (* el init))
                            (T el))) lst))

(defun make-select-between (lst l r)
    (sort (reduce #'(lambda (acc el) (if (and (> el l) (< el r))
                                    (append acc (cons el Nil))
                                    acc)) 
                                    lst :initial-value ()) 
    #'<))

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
