#lang eopl

(define lexica
  '(
    (comment ("%" (arbno (not #\newline))) skip)
    (espacio (whitespace) skip)
    (identifier (letter (arbno (or letter digit "?" "!" "-"))) symbol)
    (number (digit (arbno digit)) number)
    (number ("-" digit (arbno digit)) number)
    )
  )

(define grammar
  '(
    (programa (expresion) a-program)
    (expresion (number) lit-exp)
    (expresion (identifier) var-exp)
    (expresion (primitiva "(" (separated-list expresion ",") ")") prim-exp)
    (expresion ("if" expresion "then" expresion "else" expresion) if-exp)
    (expresion ("let" (arbno identifier "=" expresion) "in" expresion) let-exp)
    (expresion ("proc" "(" (separated-list identifier ",") ")" expresion) proc-exp)
    (expresion ("(" expresion (arbno expresion) ")") app-exp)
    (primitiva ("+") sum-prim)
    (primitiva ("-") minus-prim)
    (primitiva ("add1") add1-prim)
    (primitiva ("*") mul-prim)
    (primitiva ("sub1") sub1-prim)
    )
  )

;;Vamos a definir los ambientes
(define-datatype enviroment enviroment?
  (empty-env)
  (extend-env
   (id (list-of symbol?))
   (values (list-of value?))
   (env enviroment?)))

(define value?
  (lambda (x)
    (or (number? x) (procval? x))))

;;buscar en la lista
(define posicion-lid
  (lambda (lid sym)
    (cond
      [(null? lid) #F]
      [(eqv? (car lid) sym) 0]
      [else
       (let
           (
            (recursivo (posicion-lid (cdr lid) sym))
            )
          (if (number? recursivo)
              (+ 1 recursivo)
              #F))])))

;;Buscar el valor
(define buscar-valor
  (lambda (lvalues pos)
    (cond
      [(null? lvalues) (eopl:error "algo ha salido mal")]
      [(= pos 0) (car lvalues)]
      [else (buscar-valor (cdr lvalues) (- pos 1))])))
      

;;apply-env
(define apply-env
  (lambda (amb sym)
    (cases enviroment amb
      (empty-env () (eopl:error "No estoy"))
      (extend-env (lid lvalues old-env)
                  (let
                      (
                       (pos (posicion-lid lid sym))
                       )                    
                    (if (number? pos)
                        (buscar-valor lvalues pos)
                        (apply-env old-env sym)))))))
                  

;;Definir un ambiente inicial
(define initial-env
  (extend-env '(x y z) '(1 2 3)
              (extend-env '(carlos orion tapasco) '(4 5 6) (empty-env))))
   

;;Definir los datatyes
(sllgen:make-define-datatypes lexica grammar)
;;Listar  (sllgen:show-define-datatypes lexica grammar)

;;Procedimientos
(define-datatype procval procval?
  (closure (lid (list-of symbol?))
           (body expresion?)
           (env enviroment?)
           ))

;;Evaluar expresion
(define evaluar-expresion
  (lambda (exp amb)
    (cases expresion exp
      (lit-exp (dato) dato)
      (var-exp (id) (apply-env amb id))
      (if-exp (test-exp true-exp false-exp)
              (if (true-value? (evaluar-expresion test-exp amb))
                  (evaluar-expresion true-exp amb)
                   (evaluar-expresion false-exp amb))
              )
      (let-exp (ids rands body)
               (let
                   (
                    (lexprands (map (lambda (x) (evaluar-expresion x amb)) rands))
                    )
                 (evaluar-expresion body (extend-env ids lexprands amb))
                 )
               )
      (proc-exp (lids body)
                (closure lids body amb))
      (app-exp (rator rands)
               (let
                  (
                   (procrator (evaluar-expresion rator amb))
                   (randsexp (map (lambda (x) (evaluar-expresion x amb)) rands))
                 )
               (if
                (procval? procrator)
                (cases procval procrator
                  (closure (lids body env-old)
                           (if (= (length randsexp) (length lids))
                               (evaluar-expresion body (extend-env lids randsexp env-old))
                               (eopl:error "El número de argumentos es diferente")
                               )))
                  (eopl:error "El primer argumento debe ser un procedimiento"))))
                           
      (prim-exp (prim lexp)
                (let
                    (
                     (lexpnum (map (lambda (x) (evaluar-expresion x amb)) lexp))
                     )
                  (aplicar-primitiva prim lexpnum)

                  )
                
        )
      )
    )
  )


 (define true-value?
   (lambda (num)
     (not (zero? num))))
;;Operar
(define operar
  (lambda (l op)
    (cond
      [(eqv? (cdr l) empty) (car l)]
      [else (op (car l) (operar (cdr l) op))])))

;;aplicar-primitiva
(define aplicar-primitiva
  (lambda (prim lnum)
    (cases primitiva prim
      (sum-prim () (operar lnum +))
      (minus-prim () (operar lnum -))
      (add1-prim () (+ 1 (car lnum)))
      (mul-prim () (operar lnum *))
      (sub1-prim () (- (car lnum) 1))
      )
    )  
  )
;;evaluar programar
(define evaluar-programa
  (lambda (pgm)
    (cases programa pgm
      (a-program (exp) (evaluar-expresion exp initial-env))
      )
    )
  )

(define interpretador
  (sllgen:make-rep-loop
   "-->"
   (lambda (pgm) (evaluar-programa pgm))
   (sllgen:make-stream-parser
            lexica
            grammar)))

(interpretador)

