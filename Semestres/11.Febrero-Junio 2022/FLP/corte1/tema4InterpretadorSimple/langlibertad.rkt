#lang eopl
#|
Para la especificación léxica

    Los comentarios inician con punto y coma ";" y son de una linea
    Se tienen números positivos y negativos enteros y en punto flotante
    Todo texto inicia con comillas y termina en comillas
    Los identificadores inician con una letra seguido de cualquier numero de carácteres alfanumericos y simbolos especiales como ? ¿ #
<programa> ::= <expresion>
                (a-program (exp))
<expresion> ::= <identificador>
                             exp-literal(id)
                         ::= <numero>
                             exp-numero(dato)
                         ::=<texto>
                             exp-texto(dato)
                         ::= <booleano>
                            exp-booleano(dato)
                         ::= <primitiva>   "(" <expresion>*(,) ")"
                            exp-primitiva(op,expresiones)

<booleano> ::= "falso" | "verdadero"
                            (false-bool) | (verdadero-bool)

<primitiva> ::= "+"
                           sum-prim
                       ::= "-"
                           resta-prim
                       ::= "*"
                           mult-prim
                       ::= "/"
                           div-prim
                       ::= "%"
                           modulo-prim                      
                       ::= "<="
                           mayor-igual-prim
                        ::= ">="
                            menor-igual-prim
                        ::= ">"
                            mayor-prim
                         ::= "<"
                            menor-prim
                         ::= "y"
                            y-prim
                         ::= "o"
                            o-prim
                         ::= "o-exclusiva"
                            oex-prim
                         ::= "==>"
                            implicacion-prim
                         ::= "no"
                            negacion-prim
|#
(define lexica
  '(
    (comentario (";" (arbno (not #\newline))) skip)
    (espacio-blanco (whitespace) skip)
    (numero (digit (arbno digit)) number)
    (numero ("-" digit (arbno digit)) number)
    (numero (digit (arbno digit) "." digit (arbno digit)) number)
    (numero ("-" digit (arbno digit) "." digit (arbno digit)) number)
    (texto ("\"" (or letter digit) (arbno (or letter whitespace digit "?" "¿")) "\"") string)
    (identificador (letter (arbno (or digit "?" letter "#" "¿"))) symbol)
    ))

(define gramatical
  '(
    (programa (expresion) un-programa)
    (expresion (identificador) exp-literal)
    (expresion (numero) exp-numero)
    (expresion (booleano) exp-booleano)
    (expresion (texto) exp-texto)
    (expresion (primitiva "(" (separated-list expresion ",") ")") exp-primitiva)
    (primitiva ("+") sum-prim)
    (primitiva ("-") minus-prim)
    (primitiva ("*") mult-prim)
    (primitiva ("/") div-prim)
    (primitiva ("%") mod-prim)
    (primitiva (">=") mayor-igual-prim)
    (primitiva ("<=") menor-igual-prim)
    (primitiva (">") mayor-prim)
    (primitiva ("<") menor-prim)
    (primitiva ("y") y-prim)
    (primitiva ("o") o-prim)
    (primitiva ("o-ex") oex-prim)
    (primitiva ("==>") implicacion-prim)
    (primitiva ("no") no-prim)
    (primitiva ("**") exp-prim)
    (primitiva ("log") log-prim)
    (booleano ("verdadero") verdadero-bool)
    (booleano ("falso") falso-bool)))

;;Construir los datatypes

(sllgen:make-define-datatypes lexica gramatical)

(define mostrar-tipoDeDatos
  (lambda () (sllgen:list-define-datatypes lexica gramatical)))

(define escanear
    (sllgen:make-string-scanner lexica gramatical))

(define parser
  (sllgen:make-string-parser lexica gramatical))

(define interpretador
  (sllgen:make-rep-loop "¡LANGLIBERTAD! "
    (lambda (pgm) (evaluar-programa pgm))
    (sllgen:make-stream-parser 
      lexica
      gramatical)))

;;Evaluar programa
(define evaluar-programa
  (lambda (p)
    (cases programa p
      (un-programa (e) (evaluar-expresion e ambiente-inicial)))))

;;Define evaluar expresion
(define evaluar-expresion
  (lambda (exp amb)
    (cases expresion exp
      (exp-literal (id) (aplicar-ambiente amb id))
      (exp-numero (dato) dato)
      (exp-texto (dato) dato)
      (exp-booleano (dato) (evaluar-booleano dato))
      (exp-primitiva (prim lexp)
                     (let
                         (
                          (lista (map (lambda (x) (evaluar-expresion x amb)) lexp))
                          )
                       (aplicar-primitiva prim lista)
                         )
                     )
      )))

(define aplicar-primitiva
  (lambda (prim lista)
    (cases primitiva prim
      (sum-prim () (operar lista + 0))
      (minus-prim () (operar lista - 0))
      (mult-prim () (operar lista * 1))
      (div-prim () (operar lista / 1))
      (mod-prim () (modulo (car lista) (cadr lista)))
      (mayor-igual-prim () (>= (car lista) (cadr lista)))
      (mayor-prim () (> (car lista) (cadr lista)))
      (menor-igual-prim () (<= (car lista) (cadr lista)))
      (menor-prim () (< (car lista) (cadr lista)))
      (y-prim () (operar lista (lambda (x y) (and x y)) #T))
      (o-prim () (operar lista (lambda (x y) (or x y)) #F))
      (oex-prim () (if (eqv? (car lista) (cadr lista)) #F #T))
      (implicacion-prim () (or (not (car lista)) (cadr lista)))
      (no-prim () (not (car lista)))
      (exp-prim () (expt (car lista) (cadr lista)))
      (log-prim () (log (car lista) (cadr lista)))
      (else 0))))


(define operar
  (lambda (lst f acc [res acc])
    (cond
      [(null? lst) res]
      [else
       (operar (cdr lst) f acc (f res (car lst)))])))

(define evaluar-booleano
  (lambda (bool)
    (cases booleano bool
      (falso-bool () #F)
      (verdadero-bool () #T))))

;;Definición de ambiente
(define-datatype ambiente ambiente?
  (ambiente-vacio)
  (ambiente-extendido
   (lid (list-of symbol?))
   (lv (list-of valores?))
   (amb ambiente?)))

(define valores?
  (lambda (v) (or (number? v) (symbol? v))))

(define aplicar-ambiente
  (lambda (amb id)
    (cases ambiente amb
      (ambiente-vacio () (eopl:error "No se encontró la variable " id))
      (ambiente-extendido (lid lv amb)
                        (letrec
                            (
                             (buscar-id (lambda (l idd [pos 0])
                                          (cond
                                            [(null? l) -1]
                                            [(eqv? (car l) idd) pos]
                                            [else (buscar-id (cdr l) idd (+ pos 1))]))
                                       )
                             )
                          (let
                              (
                               (pos (buscar-id lid id))
                               )
                            (if (= pos -1)
                                (aplicar-ambiente amb id)
                                (list-ref lv pos))))))))

(define ambiente-inicial
  (ambiente-extendido '(a b c) '(1 2 3)
                      (ambiente-extendido '(x y z) '(4 5 6) (ambiente-vacio))))

(interpretador)