(defun palindromep (lst)
    (equal lst (reverse lst)))

(defun set-equal-p (flst slst)
    (and (subsetp flst slst) (subsetp slst flst)))

(defun make-country (tbl cap)
    (cond ((null tbl) Nil)
    ((equal (cdar tbl) cap) (caar tbl))
    (T (make-country (cdr tbl) cap))))
(defun make-capital (tbl ctr)
    (cond ((null tbl) Nil)
    ((equal (caar tbl) ctr) (cdar tbl))
    (T (make-capital (cdr tbl) ctr))))

(defun make-swap-first-last (lst)
    (let ((fel (car lst))
        (lel (last lst)))
    (setf (car lst) (car lel))
    (setf (car lel) fel)
    lst))

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
    (and lst (append (cdr lst) (cons (car lst) Nil))))
(defun make-swap-to-right (lst)
    (and lst (append (last lst) (nreverse (cdr (reverse lst))))))
