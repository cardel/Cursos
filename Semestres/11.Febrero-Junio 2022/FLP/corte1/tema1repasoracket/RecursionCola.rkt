#lang eopl
;;Recursión de cola
(define factorial
  (lambda (n [res 1])
    (if
     (= n 1)
     res
     (factorial (- n 1) (* n res))
     )))

(factorial 5)