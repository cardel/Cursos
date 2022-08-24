#lang eopl

(define funcion
  (lambda (num sim)
    (if
     (<= num 0)
     'error
     (cond
       [(eqv? sim 'm) 'hombre]
       [(eqv? sim 'f) 'mujer]
       [else 'error]
       )
     )
    )
  )



(define lista-factoriales
  (lambda (n)
    (letrec
        (
         (factorial (lambda (x) (if (= x 0) 1 (* x (factorial (- x 1))))))
         (generarLista
           (lambda (n acc)
             (cond
               [(= n acc) (cons (factorial acc) empty)]
               [else (cons (factorial acc) (generarLista n (+ acc 1)))]
               )
             )
           )
         )
      
      (generarLista n 0)
      )
    )
  )
 


(define predicado
  (lambda (a b)
    (cond
      [(< a b) #t]
      [(even? a) #t]
      [else #f]
      )
    )
  )
(define filtro
  (lambda (lst num pred)
    (cond
      [(null? lst) empty]
      [(pred (car lst) num) (cons (car lst) (filtro (cdr lst) num pred))]
      [else (filtro (cdr lst) num pred)]
      )
    )
  )


(define funcionMisterio
  (lambda (a b)
    (lambda (x y z) (+ x y z a b)
      )
    )
  )





(define funcionB
  (lambda (a f)
    (if (f a) "ok" "falso")))

(funcionB 4 (lambda (j) (> j 3)))


(define otraFuncion
  (lambda (a b)
    (lambda (s)
      (if
       (> a b)
       (* 2 s)
       (* -2 s)
       )
      )
    )
  )



(define funcionSecuencial
  (lambda (a)
    (begin
      (set! a (+ a 3))
      (set! a (+ a 5))
      )))


