#lang eopl

(let ((x 6)(y 7))
  (*
   (let ((y 8)) 
     (+
      (let ((x 6) (y x))
        (+ x
           (let ((y 3) (x y)) (+ x (+ 2 y)))
           )
        )
      y)
     )
   (let ((x 4)) (- y x))
   )
  )    
