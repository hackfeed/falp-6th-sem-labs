(defun internal (lst acc)
    (cond ((null lst) acc)
    (T (internal (cdr lst) (+ acc (car lst))))))
(defun rec-add (lst)
    (internal lst 0))

(defun rec-nth (lst n)
    (cond ((null lst) Nil)
    ((zerop n) (car lst))
    (T (rec-nth (cdr lst) (- n 1)))))

(defun all-odd-p (lst)
    (cond ((null lst) T)
    ((evenp (car lst)) Nil)
    (T (all-odd-p (cdr lst)))))

(defun make-last (lst)
    (cond ((null (cdr lst)) (car lst))
    (T (make-last (cdr lst)))))

(defun make-sum-zero-n (lst n)
    (cond ((or (null lst) (zerop n)) 0)
    (T (+ (car lst) (make-sum-zero-n (cdr lst) (- n 1))))))

(defun internal (lst el)
    (cond ((null lst) el)
    (T (cond ((oddp (car lst)) (internal (cdr lst) (car lst)))
        (T (internal (cdr lst) el))))))
(defun make-last-odd (lst)
    (internal lst Nil))

(defun make-square (lst)
    (cond ((null lst) Nil)
    (T (cons ((lambda (el) (* el el)) (car lst)) (make-square (cdr lst))))))

(defun make-odd (lst)
    (mapcan #'(lambda (el) (if (oddp el) (list el))) lst))

(setf people (list
    (list
        (cons 'Initials "Romanov Alexey")
        (cons 'Salary 35000)
        (cons 'Age 20)
        (cons 'Place "Tarantool Engineering"))
    (list
        (cons 'Initials "Pavel Perestoronin")
        (cons 'Salary 100500)
        (cons 'Age 20)
        (cons 'Place "Qoolo"))
    (list
        (cons 'Initials "Mikhail Nitenko")
        (cons 'Salary 500000)
        (cons 'Age 21)
        (cons 'Place "Huawei"))
    (list
        (cons 'Initials "Dmitry Yakuba")
        (cons 'Salary 1)
        (cons 'Age 20)
        (cons 'Place "DeadBrains"))
    )
)
(defun make-salaries-sum (lst)
    (reduce #'(lambda (acc x) (+ acc (cdr (assoc 'Salary x)))) lst :initial-value 0))
(defun internal (func el)
    (setf (cdr (assoc 'Salary el)) (funcall func (cdr (assoc 'Salary el)))))
(defun change-salary (lst cp sf)
    (mapcar #'(lambda (el) (if (funcall cp el) (internal sf el) (cdr (assoc 'Salary el)))) lst))
