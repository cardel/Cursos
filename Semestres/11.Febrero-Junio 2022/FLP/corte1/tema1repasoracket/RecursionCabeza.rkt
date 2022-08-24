#lang eopl
;;Recursión de cabeza
(define factorial
  (lambda (n)
    (if
     (= n 1)
     1
     (* n (factorial (- n 1)))
     )))

(factorial 5)