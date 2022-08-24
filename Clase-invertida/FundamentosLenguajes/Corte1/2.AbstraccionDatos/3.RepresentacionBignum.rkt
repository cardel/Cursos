#lang eopl
(define base 16)
(define zero '())
(define zero? null?)

(define succ
  (lambda (n)
    (cond
      [(zero? n) (list 1)]
      [(= (car n) (- base 1)) (cons 0 (succ (cdr n)))]
      [(cons (+ 1 (car n)) (cdr n))])))
    
(define pred
  (lambda (n)
    (cond
      [(zero? n) (eopl:error "El número no puede ser cero")]
      [(= (car n) 0) (cons (- base 1) (pred (cdr n)))]
      [(equal? (succ zero) n) '()]
      [else (cons (- (car n) 1) (cdr n))])))

;Area del programador
(define plus
  (lambda (x y)
    (if
     (zero? y)
     x
     (succ (plus x (pred y))))))
