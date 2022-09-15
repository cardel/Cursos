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
    (lambda (s)
      (cond
        [(= s 0) 'empty-env]
        [else (eopl:error "Señal no válida en empty-env")]))))

(define extend-env
  (lambda (lid lval env)
    (lambda (s)
      (cond
        [(= s 0) 'extend-env]
        [(= s 1) lid]
        [(= s 2) lval]
        [(= s 3) env]
        [else (eopl:error "Señal no válida en extend-env")]))))
    
;;Observadores

;;Predicados
(define empty-env?
  (lambda (e)
    (eqv? (e 0) 'empty-env)))

(define extend-env?
  (lambda (e)
    (eqv? (e 0) 'extend-env)))

;;Extractores

(define extend-env->lid
  (lambda (e)
    (e 1)))

(define extend-env->lval
  (lambda (e)
    (e 2)))

(define extend-env->env
  (lambda (e)
    (e 3)))

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