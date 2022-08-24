#lang eopl

(define inversion-aux
  (lambda (elm lst)
    (cond
      [(null? lst) 0]
      [(> elm (car lst)) (+ 1 (inversion-aux elm (cdr lst)))]
      [else (inversion-aux elm (cdr lst))]
      )
    )
  )


(define inversions
  (lambda (lst)
    (cond
      [(null? lst) 0]
      [else (+ (inversion-aux (car lst) (cdr lst)) (inversions (cdr lst)))]
      )
    )
  )

(display (inversions '(2 3 8 6 1)))
(display "\n")
(display (inversions '(1 2 3 4)))
(display "\n")
(display (inversions '(3 2 1)))
(display "\n")

(define planar
  (lambda (lst)
    (cond
      [(null? lst) '()]
      [(list? (car lst)) (append (planar (car lst)) (planar (cdr lst)))]
      [else (cons (car lst) (planar (cdr lst)))]
      )))

(display (planar '((1 2) (3 4))))
(display "\n")
(display (planar '((1 (2) 3 (1 2 3 (1 2 3 4) )))))
(display "\n")
(display (planar '(( 1 2 (1 2 (1 2 3))) 3 2 1)))
(display "\n")