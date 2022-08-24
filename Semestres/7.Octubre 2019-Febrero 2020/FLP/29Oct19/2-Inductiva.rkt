#lang eopl

;;Definición de listas pares

(define in-listaPar?
  (lambda (l)
    (cond
      [(null? l) #T]
      [else
       (and
        (in-par? (car l))
        (in-listaPar? (cdr l)))])))

(define in-par?
  (lambda (n)
    (cond
      [(= n 2) #T]
      [(< n 2) #F]
      [else (in-par? (- n 2))])))

(in-listaPar? '(2 4 6 8 10))
(in-listaPar? '(2 4 6 7 8 10))
