#lang eopl
(define zero '())
(define successor
  (lambda (n)
    (cons #t n)))
(define is-zero?
  (lambda (n)
    (null? n)))

(define predecessor
  (lambda (n)
    (if (is-zero? n)
        (eopl:error "No se puede tener predecesor 0")
        (cdr n))))

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

(define ten (list #t #t #t #t #t #t #t #t #t #t))
(define five (list #t #t #t #t #t))

(display (mult ten five))