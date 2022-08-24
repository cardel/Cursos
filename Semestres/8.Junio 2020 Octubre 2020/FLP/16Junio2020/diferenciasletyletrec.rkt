#lang eopl


;;Let permite definir variables pero no se conocen entre ellas

(let
    (
     (a 2)
     (b 3)
     (c (lambda (x y) (+ x y)))
     )
  (c a b)
  )

;let* permite definir variables, pueden conocerse entre ellas, pero no a así mismas

(let*
    (
     (a 2)
     (b (+ a 4))
     (c (lambda (x y) (+  (* x a) (* x b))))
     )
  (c 4 3)
  )

;letrec permite definir variables, se pueden conocer a sí mismas
(letrec
    (
     (a 4)
     (b 5)
     (f (lambda (x y)  (if (<= x 0) 0 (+ y (f (- x 1) y)))))
     )
  (f a b)
  )