#lang eopl
#|
<num> ::= (zero) 0

succ = |n| -> |n+1|
pred = |n| -> |n-1|
is-zero? = #T si n==0 else #F
|#

;Constructor
(define zero
  (lambda () '()))
;Predicado
(define zero?
  (lambda (n) (null? n)))
;FUnciones de trabajo
(define succ
  (lambda (n) (cons #T n)))

(define pred
  (lambda (n)
    (if (not (null? n))
        (cdr n)
        (eopl:error "No se puede sacar el pred a cero"))))


;Implementación <zona del programador>