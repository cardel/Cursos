#lang eopl

;;Definición bignum


(define zero '())
(define iszero? null?)
;;Nuestro sistema trabaja en base 16
(define base 20)

(define succ
  (lambda (num)
    (cond
      [(iszero? num) (list 1)]
      [(= (car num) (- base 1))(cons 0 (succ (cdr num)))]
      [else (cons (+ 1 (car num)) (cdr num))])))

(define pred
  (lambda (num)
    (cond
      [(iszero? num) (eopl:error "No puedo :(")]
      [(equal? num (succ zero)) empty]
      [(= (car num) 0) (cons (- base 1) (pred (cdr num)))]
      [else (cons (- (car num) 1) (cdr num))])))


;Area programador

(define sumar
  (lambda (a b)
    (cond
      [(iszero? b) a]
      [(succ (sumar a (pred b)))])))

(sumar '(0 1) '(1 2))
    
