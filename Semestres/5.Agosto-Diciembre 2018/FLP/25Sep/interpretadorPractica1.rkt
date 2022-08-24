#lang eopl

(define lexica
  '(
    (espacio (whitespace) skip)
    (texto (letter (arbno (or letter digit))) string)
    (numero (digit (arbno digit)) number)
    (numero ("-" digit (arbno digit)) number)
    (numero (digit (arbno digit) "." digit (arbno digit)) number)
    )
  )

(define gramatica
  '(
    (programa (expresion) un-programa)
    (expresion ("\"" texto "\"") texto-exp)
    (expresion (numero) numero-exp)
    ;;expresion expresion* = expresion+
    (expresion (primitiva "[" expresion (arbno ";" expresion) "]") primitiva-exp)
    (primitiva ("+") suma-prim)
    (primitiva ("-") menos-prim)
    (primitiva ("*") mult-prim)
    (primitiva ("modulo") mod-prim)
    (primitiva ("length") length-prim)
    (primitiva ("concat") concat-prim)))

;;Construyo datatypes
(sllgen:make-define-datatypes lexica gramatica)
             
;;Interpretador
(define interpretador
  (sllgen:make-rep-loop "xXx_Interpretador_xXx"
    (lambda (pgm) (evaluar-programa  pgm))
    (sllgen:make-stream-parser 
      lexica
      gramatica)))

(define evaluar-programa
  (lambda (pgm)
    (cases programa pgm
      (un-programa (exp) (evaluar-expresion (ambiente-inicial) exp)))))

(define evaluar-expresion
  (lambda (amb exp)
    (cases expresion exp
      (texto-exp (texto) texto)
      (numero-exp (numero) numero)
      (primitiva-exp (prim ep lep)
                     (let
                         (
                          (argumentos (map (lambda (x) (evaluar-expresion amb x)) lep))

                          (primerargo (evaluar-expresion amb ep))
                          )
                       (evaluar-primitiva prim primerargo argumentos)
                       )
                     )
      )
    )
  )

(define evaluar-primitiva
 (lambda (prim parg larg)
   (cases primitiva prim
     (suma-prim () (+ parg (funcion-lohacetodo + larg)))
     (menos-prim () (- parg (funcion-lohacetodo + larg)))
     (mult-prim () (* parg (funcion-lohacetodo * larg)))
     (mod-prim () (modulo parg (car larg)))
     (length-prim () (string-length parg))
     (concat-prim () (string-append parg (funcion-lohacetodo string-append larg))))
  
     ))

(define funcion-lohacetodo
  (lambda (op larg)
    (cond
      [(null? larg)
       (cond
         [(or (eqv? op +) (eqv? op -)) 0]
         [(eqv? op string-append) ""]
         [else 1])]
      [else
       (op (car larg) (funcion-lohacetodo op (cdr larg)))])))
                           


(define-datatype ambiente ambiente?
  (ambiente-vacio)
  (ambiente-extendido
   (lsym (list-of symbol?))
   (lval (list-of number?))
   (env ambiente?)
   ))

(define ambiente-inicial
  (lambda ()
    (ambiente-extendido
     '(x y z)
     '(0 1 2)
     (ambiente-extendido
      '(a b c d)
      '(20 30 40 50)
      (ambiente-vacio)))))