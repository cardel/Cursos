#lang eopl
(define par?
  (lambda (n)
    (cond
      [(= n 2) #T]
      [(< n 2) #F]
      [else (par? (- n 2))])))

(define listapar?
  (lambda (l)
    (cond
      [(null? l) #T]
      [(list? l)
       (and
        (par? (car l))
        (listapar? (cdr l)))]
      [else #F])))

(define listalistapar?
  (lambda (l)
    (cond
      [(null? l) #T]
      [(list? l)
       (and
        (listapar? (car l))
        (listalistapar? (cdr l)))]
      [else #F])))

(display (listalistapar? '( ( 2 30 4 90 2 10) (10 20 30 40))))
(display (listalistapar? '( ( 2 30 4 90 2 10) (10 20 30 40) 4)))