#lang eopl
#|
<lc-exp> ::= <identifier>
                     var-exp(id)
                ::= "lambda" <identifier> <lc-exp>
                    lambda-exp(id body)
                ::= <lc-exp> <lc-exp>
                   app-exp(rator rand)
|#
(define-datatype lc-exp lc-exp?
  (var-exp (id symbol?))
  (lambda-exp (id symbol?)
              (body lc-exp?))
  (app-exp (rator lc-exp?)
           (rand lc-exp?)))

(define exp1 '(lambda (x) (x y)))
(define exp2 'x)
(define exp3 '(x (lambda (x) (x x))))

(define parser
  (lambda (exp)
    (cond
      [(symbol? exp) (var-exp exp)]
      [(eqv? (car exp) 'lambda)
       (lambda-exp
        (caadr exp)
        (parser (caddr exp)))]
      [else
       (app-exp
        (parser (car exp))
        (parser (cadr exp)))])))