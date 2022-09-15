#lang eopl
#|
<num> ::= (zero) 0

succ = |n| -> |n+1|
pred = |n| -> |n-1|
is-zero? = #T si n==0 else #F
|#

;Constructor
(define zero
  (lambda () 0))
;Predicado
(define zero?
  (lambda (n) (= n 0)))
;FUnciones de trabajo
(define succ
  (lambda (n) (+ n 1)))

(define pred
  (lambda (n)
    (if (not (zero? n))
        (- n 1)
        (eopl:error "No se puede sacar el pred a cero"))))


;Implementación <zona del programador>

(define add
  (lambda (a b)
    (if
     (zero? a)
     b
     (succ (add (pred a) b)))))