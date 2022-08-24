#lang eopl

(define (list-index f l)
  (cond
    [(null? l) #F]
    [else (letrec
         (
          (list-index-aux
           (lambda (f l acc)
               (cond
                 [(null? l) #F]
                 [(f (car l)) acc]
                 [else (list-index-aux f (cdr l) (+ acc 1))]
                 )
               )
             )
          )
            (list-index-aux f l 0)
            )
          ]
    )
  )

