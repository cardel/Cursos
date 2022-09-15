#lang eopl
#|
<enviroment> ::=  '()
                                empty-env()
                           ::= <list id> <list val> <enviroment>
                              extend-env(lid lval env)
|#
(define-datatype enviroment enviroment?
  (empty-env)
  (extend-env (lid (list-of symbol?))
              (lval (list-of number?))
              (env enviroment?)
              ))


(define env1
  (extend-env
   '(x y z)
   '(1 2 3)
   (extend-env
    '(a b c)
    '(4 5 6)
    (empty-env)
    )
   ))

(define apply-env
  (lambda (e s)
    (cases enviroment e
      (empty-env () (eopl:error "No se encuentra el símbolo" s))
      (extend-env
       (lid lval env)
       (let
           (
            (val (buscar-valor lid
                               lval
                               s))
            )
         (if
          (number? val)
          val
          (apply-env env s))
         ))
      )
    )
  )

(define buscar-valor
  (lambda (lid lval s)
    (cond
      [(null? lid) #F]
      [(eqv? (car lid) s) (car lval)]
      [else (buscar-valor (cdr lid) (cdr lval) s)])))
