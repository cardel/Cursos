#lang eopl
(define zero 0)
(define zero?
  (lambda (n)
    (= n 0))
  )
(define succ
  (lambda (n) (+ n 1)))
(define pred
  (lambda (n)
    (if (zero? n)
        (eopl:error "El número no puede ser cero")
        (- n 1))))
;Area del programador
(define plus
  (lambda (x y)
    (if
     (zero? y)
     x
     (succ (plus x (pred y))))))

(display (plus 3 4))

        

