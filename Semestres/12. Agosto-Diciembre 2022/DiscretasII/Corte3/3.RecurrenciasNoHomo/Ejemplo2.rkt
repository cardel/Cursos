#lang eopl
(define (T n)
   (cond
      [(= n 0) 6]
      [(= n 1) 12]
      [else 
       (+ (* 4 (T (- n 1)))
          (* 4 (- (T (- n 2))))
          (expt 2 n)
           n)]))

(define (f n)
  (+
   (* 2 (expt 2 n))
   (* n (expt 2 n))
   (* 0.5 (expt n 2) (expt 2 n))
   n
   4))


(define a
  (list 1 2 3 4 5 ))

(define (T2 n)
  (cond
    [(= n 1) 4]
    [else
     (+
      (T2 (/ n 4))
      (log n 4))]))

(define (f2 n)
  (+
   (* 6 (sqrt n))
   (- (log n 4))
   -2))

(define a2
  (list 1 4 16 64 256))

(display "Problema 1")
(map T a)
(map f a)
(display "Problema 2")
(map T2 a2)
(map f2 a2)
	