#lang eopl

(define-datatype lc-exp lc-exp?
  (var-exp (id symbol?))
  (lambda-exp (id symbol?)
              (body lc-exp?))
  (app-exp (rator lc-exp?)
           (rand lc-exp?)))

;;(lambda (x) (f (f x))

(define exp1 (lambda-exp 'x  (app-exp
                 (var-exp 'f)
                 (app-exp (var-exp 'f) (var-exp 'x))
                          )
                 )
  )
