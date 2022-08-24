#lang eopl

(define exp1 '(lambda (y) (x y)))
(define exp2  '( x  (lambda (y) (lambda (x) (x (a (lambda (y) (a b)))))  )))
(define exp4  '((lambda (y) (x y)) (lambda (y) (lambda (x) (x (a (lambda (y) (a b)))))  )))

(define-datatype lc-exp lc-exp?
  (var-exp (dato symbol?))
  (lambda-exp (bound-var symbol?)
              (body lc-exp?))
  (app-exp (rator lc-exp?)
           (rand lc-exp?)))

;;Parseo: Es el proceso de pasar de sintaxis concreta a sintaxis abstract


(define parser
  (lambda (exp)
    (cond
      [(symbol? exp) (var-exp exp)]
      [(equal? (car exp) 'lambda) (lambda-exp (caadr exp) (parser (caddr exp)))]
      [else
       (app-exp
        (parser (car exp))
        (parser (cadr exp)))])))

;;Unparseo: COnsiste en pasar de sintaxis abstracta a sintaxis a concreta
(define unparser
  (lambda (exp)
    (cases lc-exp exp
      (var-exp (id) id)
      (lambda-exp (id body) (list 'lambda (list id) (unparser body)))
      (app-exp (rator rand) (list (unparser rator) (unparser rand))))))

(define exp3
  (app-exp
   (lambda-exp 'y (lambda-exp 'y (var-exp 'x)))
   (app-exp
    (lambda-exp 'z (var-exp 'x))
    (var-exp 'x))
   )
  )
