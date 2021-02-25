(defun make-far-to-cel (temp)
    (* (/ 5 9) (- temp 32.0)))

(list 'cons t NIL)                  ; (CONS T NIL)
(eval (eval (list 'cons t NIL)))    ; The function T is undefined, and its name is reserved by ANSI CL
(apply #'cons '(t NIL))             ; (T)
(list 'eval NIL)                    ; (EVAL NIL)
(eval (list 'cons t NIL))           ; (T)
(eval NIL)                          ; NIL
(eval (list 'eval NIL))             ; NIL

(defun make-cathet (hyp cath)
    (sqrt (- (* hyp hyp) (* cath cath))))

(defun make-trapezium-square (a b h)
    (* (/ (+ a b) 2.0) h))
