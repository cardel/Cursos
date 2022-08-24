#lang eopl
(define elevar
  (lambda (lst)
    (if
     (null? lst)
     '()
     (cons (expt (car lst) 2)
           (elevar (cdr lst))))))


(define operar
  (lambda (lst f)
    (if
     (null? lst)
     '()
     (cons (f (car lst))
           (operar (cdr lst) f)))))


(define crear-funcion
  (lambda (x y)
    (lambda (a) (if (odd? x) (* a x) (* y a)))))