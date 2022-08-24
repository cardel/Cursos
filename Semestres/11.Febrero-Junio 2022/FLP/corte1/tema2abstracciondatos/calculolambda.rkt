#lang eopl
(define lambda-exp?
  (lambda (exp)
    (cond
      [(symbol? exp) #T]
      [(and
        (eqv? (car exp) 'lambda)
        (symbol? (caadr exp))
        (lambda-exp? (caddr exp))) #T]
      [(and
        (lambda-exp? (car exp))
        (lambda-exp? (cadr exp))) #T]
      [else #F])))

(display (lambda-exp? 'x))
(display (lambda-exp? '(lambda (x) (x y))))
(display (lambda-exp?
          '(
            (x (lambda (x) y))
            (x (x y)))))

