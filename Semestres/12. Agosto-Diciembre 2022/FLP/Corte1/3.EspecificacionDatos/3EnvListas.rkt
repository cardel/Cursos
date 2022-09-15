#lang eopl
#|
<enviroment> ::=  '()
                                empty-env()
                           ::= <list id> <list val> <enviroment>
                              extend-env(lid lval env)
|#

;;1. Hago los constructores
(define empty-env
  (lambda ()
    (list 'empty-env)))

(define extend-env
  (lambda (lid lval env)
    (list 'extend-env lid lval env)))

;;Observadores

;;Predicados
(define empty-env?
  (lambda (e)
    (eqv? (car e) 'empty-env)))

(define extend-env?
  (lambda (e)
    (eqv? (car e) 'extend-env)))

;;Extractores

(define extend-env->lid
  (lambda (e)
    (cadr e)))

(define extend-env->lval
  (lambda (e)
    (caddr e)))

(define extend-env->env
  (lambda (e)
    (cadddr e)))

;;Programador

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
    (cond
      [(empty-env? e) (eopl:error "No se encuentra ~s" s)]
      [(extend-env? e)
       (let
           (
            (val (buscar-valor (extend-env->lid e)
                               (extend-env->lval e)
                               s))
            )
         (if
          (number? val)
          val
          (apply-env (extend-env->env e) s))
         )
       ]
      [else (eopl:error "Dato mal construido")]
      )
    )
  )

(define buscar-valor
  (lambda (lid lval s)
    (cond
      [(null? lid) #F]
      [(eqv? (car lid) s) (car lval)]
      [else (buscar-valor (cdr lid) (cdr lval) s)])))