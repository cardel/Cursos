#lang eopl
(define zero '())
(define zero? null?)
(define succ
  (lambda (n) (cons #t n)))
(define pred
  (lambda (n)
    (if (zero? n)
        (eopl:error "El número no puede ser cero")
        (cdr n))))

;Area del programador
(define plus
  (lambda (x y)
    (if
     (zero? y)
     x
     (succ (plus x (pred y))))))

(display (plus '(#t #t #t) '(#t #t #t #t)))

