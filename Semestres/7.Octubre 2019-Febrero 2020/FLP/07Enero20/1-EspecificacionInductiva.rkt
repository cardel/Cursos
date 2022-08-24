#lang eopl

;Lista de números pares

(define in-P?
  (lambda (n)
    (cond
      [(= n 2) #T]
      [(< n 2) #F]
      [else (in-P? (- n 2))])))

(define in-S?
  (lambda (l)
    (cond
      [(null? l) #T]
      [else
       (and
        (in-S? (cdr l))
        (in-P? (car l)))])))

(in-S? '(2 4 2 4 8))
(in-S? '(2 4 2 4 11 8))