;;; Second element
(cadr '(rose violet daisy buttercup))
;;; Third element
(caddr '(rose violet daisy buttercup))
;;; Fourth element
(cadddr '(rose violet daisy buttercup))

(caadr '((blue cube)(red pyramid))) ; RED
(cdar '((abc)(def)(ghi)))           ; NIL
(cadr '((abc)(def)(ghi)))           ; (DEF)
(caddr '((abc)(def)(ghi)))          ; (GHI)

(list 'Fred'and Wilma)              ; UNBOUND VARIABLE   
(list 'Fred'(and Wilma))            ; (FRED (AND WILMA))
(cons Nil Nil)                      ; (NIL)
(cons T Nil)                        ; T
(cons Nil T)                        ; (NIL . T)
(list Nil)                          ; (NIL)
(cons (T) Nil)                      ; UNDEFINED FUNCTION
(list '(one two) '(free temp))      ; ((ONE TWO) (FREE TEMP))
(cons 'Fred'(and Wilma))            ; (FRED AND WILMA)
(cons 'Fred'(Wilma))                ; (FRED WILMA)
(list Nil Nil)                      ; (NIL NIL)
(list T Nil)                        ; (T NIL)
(list Nil T)                        ; (NIL T)
(cons T (list Nil))                 ; (T NIL)
(list (T) Nil)                      ; UNDEFINED FUNCITON
(cons '(one two) '(free temp))      ; ((ONE TWO) FREE TEMP)

(defun f1 (ar1 ar2 ar3 ar4) 
    (list (list ar1 ar2) (list ar3 ar4)))
(defun f2 (ar1 ar2) 
    (list (list ar1) (list ar2)))
(defun f3 (ar1) 
    (list (list (list ar1))))
