#lang eopl
;;Implementación
(define zero 0)
(define is-zero?
   (lambda (n) (= n 0)))
(define successor
  (lambda (n) (+ n 1)))
(define predecessor
  (lambda (n) (if (is-zero? n)
                  (eopl:error "Cero no tiene predecesor" "predecessor")
                  (- n 1))))

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

(mult 10 2000)