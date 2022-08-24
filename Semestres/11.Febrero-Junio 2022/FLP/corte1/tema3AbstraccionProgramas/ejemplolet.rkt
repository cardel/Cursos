#lang eopl
(let
    (
     (x 3)
     (y 4)
     )
  (let
      (
       (x (+ x 1))
       (y (+ x 3))
       )
    (+ x y)))

(let*
    (
     (x 3)
     (y 4)
     )
  (let*
      (
       (x (+ x 1))
       (y (+ x 3))
       )
    (+ x y)))

(letrec
    (
     (funcion (lambda (x [acc 0]) (if (= x 0) acc (funcion (- x 1) (+ acc 2)))))
     )
  (funcion 3))