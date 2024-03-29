(defun palindromep (lst)
    (equal lst (reverse lst)))

(defun mymemberp (lst el)
    (cond ((null lst) Nil)
    ((equal (car lst) el) lst)
    (T (mymemberp (cdr lst) el))))
(defun includep (flst slst)
    (cond ((null flst) T)
    ((mymemberp slst (car flst)) (includep (cdr flst) slst))
    (T Nil)))
(defun lstequalp (flst slst)
    (and (includep flst slst) (includep slst flst)))

(defun make-country (tbl cap)
    (cond ((null tbl) Nil)
    ((equal (cdar tbl) cap) (caar tbl))
    (T (make-country (cdr tbl) cap))))
(defun make-capital (tbl ctr)
    (cond ((null tbl) Nil)
    ((equal (caar tbl) ctr) (cdar tbl))
    (T (make-capital (cdr tbl) ctr))))

(defun my-last (lst)
    (cond ((null lst) lst)
    ((null (cdr lst)) lst)
    (T (my-last (cdr lst)))))
(defun change-last (lst el)
    (cond ((null lst) lst)
    ((null (cdr lst)) (cons el Nil))
    (T (cons (car lst) (change-last (cdr lst) el)))))
(defun make-swap-first-last (lst)
    (change-last (cons (car (my-last lst)) (cdr lst)) (car lst)))


(defun make-swap-two-els (lst i j)
    (let ((len (length lst))
        (lstcp (copy-list lst)))
    (and (< i len) (< j len)
    (let ((fel (nth i lst))
        (lel (nth j lst)))
    (setf (nth i lstcp) lel)
    (setf (nth j lstcp) fel)
    lstcp))))

(defun make-swap-to-left (lst)
    (and lst (nreverse (cons (car lst) (nreverse (cdr lst))))))
(defun make-swap-to-right (lst)
    (and lst (nreverse (cdr (nreverse (cons (car (my-last lst)) lst))))))
