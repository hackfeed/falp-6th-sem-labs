(defun make-select-in-ten (lst)
    (reduce #'(lambda (acc el) (if (and (> el 1) (< el 10))
                                (append acc (cons el Nil))
                                acc)) 
                                lst :initial-value ()))

(defun make-cartesian (flst slst)
    (mapcan #'(lambda (fel) (mapcar #'(lambda (sel) (cons fel sel)) slst)) flst))

(defun make-lsts-len (lst)
    (reduce #'(lambda (acc el) (+ acc (length el))) lst :initial-value 0))

(defun make-square-lsts (lst)
    (cond ((null lst) Nil)
    ((symbolp (car lst)) (make-square-lsts (cdr lst)))
    ((numberp (car lst)) (cons (* (car lst) (car lst)) (make-square-lsts (cdr lst))))
    (T (nconc (make-square-lsts (car lst)) (make-square-lsts (cdr lst))))))
