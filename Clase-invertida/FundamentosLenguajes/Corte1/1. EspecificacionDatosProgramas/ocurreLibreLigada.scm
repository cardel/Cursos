#lang racket
(define occurs-free?
  (lambda (var exp)
    (cond
      ((symbol? exp) (eqv? var exp))
      ((eqv? (car exp) 'lambda) 
       (and (not (eqv? (caadr exp) var))
            (occurs-free? var (caddr exp))))
      (else (or (occurs-free? var  (car exp))
                (occurs-free? var (cadr exp)))))))


(define exp1 '(lambda (x y) ((lambda (a) (x (a y)))x)))
(occurs-free? 'x exp1)

(define exp2 '((lambda (x) x) y))
(occurs-free? 'y exp2)

(define exp4 '(lambda (y) ((lambda (x) x) y)))
(occurs-free? 'y exp4)

(define exp5 '(lambda (x y z) (a b)))
(occurs-free? 'x exp5)