#lang eopl

(define fibunnacci
  (lambda (n)
    (cond
      [(= n 0) 1]
      [(= n 1) 1]
      [else (+ (fibunnacci (- n 1)) (fibunnacci (- n 2)))]
      )))

(define lista-fibunnacci_ind
  (lambda (n)
    (if
     (= n 0)
     (list (fibunnacci n))
     (append (lista-fibunnacci_ind (- n 1)) (list (fibunnacci n) )))))


(define lista-fibunnacci
  (lambda (n)
    (if
     (= n 0)
     (list (lista-fibunnacci_ind n))
     (append (lista-fibunnacci (- n 1)) (list (lista-fibunnacci_ind n)) ))))
     

