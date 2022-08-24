#lang eopl

(define lista-factoriales
  (lambda (n)
    (if
     (= n 1)
     (list (factorial n))
     (append (lista-factoriales (- n 1)) (list (factorial n)))
     )
    )
  )

(define factorial
  (lambda (n)
    (if
     (= n 1)
     1
     (* n (factorial (- n 1)))
     )))