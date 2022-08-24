#lang eopl


(define contar-ocurrencias-s
  (lambda (lst sym)
    (cond
      [(null? lst) 0]
      [(list? (car lst))
              (+
               (contar-ocurrencias-s (car lst) sym)
               (contar-ocurrencias-s (cdr lst) sym)
               )
              ]
      [(eqv? (car lst) sym)
       (+ 1 (contar-ocurrencias-s (cdr lst) sym))
       ]
      [else (contar-ocurrencias-s (cdr lst) sym)]
      )
    )
  )

(display (contar-ocurrencias-s '(a b c d e (a b c d a a) (a a a (b b b (a a a))) (a a (b c (t (a b c)))) a (a b c)) 'a))