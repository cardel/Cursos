#lang eopl
(define base 16)

(define zero '())
(define is-zero? null?)

(define successor
  (lambda (n)
    (cond
      [(is-zero? n) (cons 1 empty)]
      [(= (car n) (- base 1))
       (cons 0 (successor (cdr n)))]
      [else
       (cons (+ (car n) 1) (cdr n))])))

(define predecessor
  (lambda (n)
    (cond
      [(is-zero? n) (eopl:error "No puede manejar predecesor de cero")]
      [(equal?  n (cons 1 empty)) '()]
      [(= (car n) 0)
       (cons (- base 1) (predecessor (cdr n)))]
      [else (cons (- (car n) 1) (cdr n))]
       )))

;;Area del programador
(define plus
  (lambda (a b)
    (cond
      [(is-zero? b) a]
      [else
       (plus (successor a) (predecessor b))]
      )
    ))

(define mult
  (lambda (a b)
    (if
     (is-zero? b)
     zero
     (plus a (mult a (predecessor b)))
     )))

;;230688
(display (mult '(0 2 1) '(1 2 3)))
      