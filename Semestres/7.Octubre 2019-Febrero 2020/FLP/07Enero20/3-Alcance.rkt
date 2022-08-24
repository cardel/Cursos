#lang eopl

(let
   (
     (x 5) (y 6) (p 7)
   )
   (let
     (
       (x (+ x y)) (y 9) (p (+ y 1))
     )
         (+ x y p)
   ))
