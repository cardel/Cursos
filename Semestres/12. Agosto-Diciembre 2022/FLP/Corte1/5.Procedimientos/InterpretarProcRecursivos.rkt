#lang eopl
#|
Diseñe un interpretador para el siguiente programa:

<programa> := expresion
             (un-programa)   

<expresion> := <número> 
             (numero-lit)
            := "<letras>"
             (texto-lit)
              Ejemplo +[1;2;3;4] debe retornar 10
            :=<primitiva> [expresion (expresion*) (;)]
             (primitiva-exp)


<número> digito digito*
<letras> letra (letra | digito)*

Operaciones numéricas

+ - * /  (operan todos los elementos de la lista)

Operaciones de texto

concat (Concatena todos los textos ingresados)
lenght (Sólo devuelve el tamaño del primer elemento)

Agregue lo siguiente:
******************************************
;ambiente

<ambiente>: (vacio) '()
           (extendido) (lista-simbolos) (lista-expresiones) <ambiente>

;Defina un ambiente inicial con los simbolos ("a" "b" "c") con valores ((numero-lit 1) (numero-lit 2) (numero-lit 3)), modifique evaluar-expresion para que se acepte

;DIseñe una función llamada (buscar-variable) que recibe un simbolo (identificador) y un ambiente, retorna el valor si lo encuentra en caso contrario "Error, la variable no existe"



******************************************
;(identificador-exp)
<identificador>: es el mismo texto, recuerde que en el DrRacket se tratan como Strings

Pruebe
> a
1
> b
2


******************************************
;Booleanos

- true para verdadero
- false para falso


Agregar los procedimientos

<expresion> ::= "proc" "(" (texto ",")* ")" <expresion> "end"
                proc-exp(largs,body)

<expresion> ::= "(" <expresion> <expresion>* ")"
                app-exp(rator, rands)

Ejemplo

declare x=2;
        y=proc(m,n) +[m,n] end
        a=7 
        do (y x a) end

Debe retornar 9

Agregar procedimientos recursivos

<expresion> ::= "letrec" ("texto" "(" (texto ",")* = <expresion> ";")* "do" <expresion> "end"

letrec
      g(a,b) = if >(a,0) then +[b,(g -[a,1] b)] else b
      do
         (g 2 3)

      end

Debe retornar 6.
|#
;;Especificación léxica
;; Comentarios comienzan #
;;Vamos a definir las unidades significativas
(define especificacion-lexica
  '(
    (comentarios ("#" (arbno (not #\newline))) skip)
    (espacios (whitespace) skip)
    (numero (digit (arbno digit)) number)
    (texto (letter (arbno (or letter digit "?" "!"))) symbol)
    ))

(define especificacion-gramatical
  '(
    (programa (expresion) un-program)
    (expresion (numero) num-exp)
    (expresion (texto) var-exp)
    (expresion ("\"" texto "\"") texto-exp)
    (expresion (primitiva "[" expresion (arbno "," expresion) "]") prim-exp)
    (expresion (primitiva-doble "[" expresion "," expresion "]") prim-doble-exp)

    ;;Booleanos
    (expresion ("true") true-exp)
    (expresion ("false") false-exp)
    ;;Condicional
    (expresion ("if" expresion "then" expresion "else" expresion "end") if-exp)    
    ;;Ligaduras locales
    (expresion ("declare" (separated-list texto "=" expresion ";") "do" expresion "end") local-exp)
    ;;Procedimientos
    (expresion ("proc" "(" (separated-list texto ",") ")" expresion "end") proc-exp)
    (expresion ("(" expresion (arbno expresion) ")") app-exp)
    ;;Proc recursivos
    (expresion ("letrec" (arbno texto "(" (separated-list texto ",") ")" "=" expresion) "do" expresion) letrec-exp)
    ;;Primitivas
    (primitiva ("+") sum-prim)
    (primitiva ("-") res-prim)
    (primitiva ("*") mul-prim)
    (primitiva ("/") div-prim)
    (primitiva-doble (">") mayor-prim)
    (primitiva-doble (">=") mayor-igual-prim)
    (primitiva-doble ("<") menor-prim)
    (primitiva-doble ("<=") menor-igual-prim)
    ))

(sllgen:make-define-datatypes especificacion-lexica especificacion-gramatical)
(define datatypes (sllgen:list-define-datatypes especificacion-lexica especificacion-gramatical))

(define escaner
  (lambda (exp)
    ( (sllgen:make-string-scanner
     especificacion-lexica
     especificacion-gramatical) exp)))

(define parser
  (lambda (exp)
    (
     (sllgen:make-string-parser
      especificacion-lexica
      especificacion-gramatical)
     exp)))
;;;Definir los ambiente
(define-datatype ambiente ambiente?
  (ambiente-vacio)
  (ambiente-extendido
   (lid (list-of symbol?))
   (lva (list-of value?))
   (env ambiente?))
  (ambiente-extendido-recursivo
   (proc-names (list-of symbol?))
   (llargs (list-of (list-of symbol?)))
   (lbodys (list-of expresion?)) ;Cuerpo procs
   (env ambiente?));Expresion a evaluarambiente-extendido-recursivo
   )
  
 

;;Función para buscar dentro un ambiente
(define apply-env
  (lambda (env var)
    (cases ambiente env
      (ambiente-vacio () (eopl:error "No se encuentra la ligadura " var))
      (ambiente-extendido
       (lid lval old-env)
       (letrec
           (
            (buscar-id
             (lambda (lidd lvall varr)
               (cond
                 [(null? lidd) (apply-env old-env varr)]
                 [(eqv? (car lidd) varr) (car lvall)]
                 [else (buscar-id (cdr lidd) (cdr lvall) varr)])))
            )
         (buscar-id lid lval var)))
      (ambiente-extendido-recursivo
       (proc-names llargs bodies env-old)
       (letrec
           (
            (buscar-proc
             (lambda (proc-names llargs bodies)
               (cond
                 [(null? proc-names)
                  (apply-env env-old var)]
                 [(eqv?
                   (car proc-names)
                   var)
                  (clausura
                   (car llargs)
                   (car bodies)
                   env) ;Aqui generamos la clausura
                  ]
                 [else
                  (buscar-proc (cdr proc-names)
                               (cdr llargs)
                               (cdr bodies))])))
            )
         (buscar-proc proc-names llargs bodies)))
      )
    )
  )

(define value?
  (lambda (v) #T))

(define ambiente-inicial
  (ambiente-extendido '(x y z) '(1 2 3) 
                      (ambiente-extendido '(a b c) '(4 5 6)
                                          (ambiente-vacio))))

(define interprete
  (sllgen:make-rep-loop
   "-->"
   (lambda (exp) (evaluar-programa exp))
   (sllgen:make-stream-parser
    especificacion-lexica
    especificacion-gramatical)))

(define evaluar-programa
  (lambda (pgm)
    (cases programa pgm
      (un-program (exp)
                   (evaluar-expresion exp ambiente-inicial)))))



(define evaluar-expresion
  (lambda (exp amb)
    (cases expresion exp
      (num-exp (val) val)
      (texto-exp (txt) txt)
      (var-exp (var) (apply-env amb var))
      (prim-exp (prim exp lexp)
                (let
                    (
                     (exp1 (evaluar-expresion exp amb))
                     (lexp1 (map (lambda (x) (evaluar-expresion x amb)) lexp))
                     )
                  (aplicar-primitiva prim exp1 lexp1)))
      (true-exp () #T)
      (false-exp () #F)
      (prim-doble-exp (prim exp1 exp2)
                           (aplicar-primitiva-doble
                            prim
                            (evaluar-expresion exp1 amb)
                            (evaluar-expresion exp2 amb)))
      (if-exp (cond-exp true-exp false-exp)
              (let
                  (
                   (cond-exp1 (evaluar-expresion cond-exp amb))
                   )
                (if (boolean? cond-exp1)
                    (if
                     cond-exp1
                     (evaluar-expresion true-exp amb)
                     (evaluar-expresion false-exp amb))
                    (eopl:error "La condición del if debe ser un booleano"))))
      (local-exp (lid lexp exp)
                 (let
                     (
                      (lexp1 (map (lambda (x) (evaluar-expresion x amb)) lexp))
                      )
                   (evaluar-expresion
                    exp
                    (ambiente-extendido lid lexp1 amb))))
      ;;Procedimientos
      (proc-exp (largs body)
                (clausura largs body amb))
      (app-exp (rator rands)
               (let
                   (
                    (proc (evaluar-expresion rator amb))
                    (lrands (map (lambda (x) (evaluar-expresion x amb)) rands))
                    )
                 (if
                  (procval? proc)
                  (cases procval proc
                    (clausura
                     (lids body env-old)
                     (evaluar-expresion body (ambiente-extendido lids lrands env-old))))
                  (eopl:error "Para evaluar debe enviar un procedimiento"))))
      ;;Procedimiento recursivo
      (letrec-exp (proc-names llargs bodies body)
                  (evaluar-expresion body (ambiente-extendido-recursivo proc-names llargs bodies amb)))
      (else 0))))

;;Operar
(define operar
  (lambda (op first lst acc)
    (op first (operar-aux op acc lst))))
 
(define operar-aux
  (lambda (op acc lst)
    (cond
      [(null? lst) acc]
      [else
       (op (car lst)
           (operaret
         a = +((f x y), (g x y z))
         b = let k = proc(a,b) +(a,b) in (k x y)
         in
            letrec
                    h(x,y) = if >(x,0) then +((f a b), (g -(x,1) y)) else y
                    g(m,n) = if >(m,0) then +(a, (h -(m,1) n)) else n
                    in
                         (h 6 a)  op acc (cdr lst)))])))


;;Primitivas
(define aplicar-primitiva
  (lambda (prim exp lexp)
    (cases primitiva prim
      (sum-prim () (operar + exp lexp 0))
      (res-prim () (operar - exp lexp 0))
      (mul-prim () (operar * exp lexp 1))
      (div-prim () (operar / exp lexp 1)))))

(define aplicar-primitiva-doble
  (lambda (prim exp1 exp2)
    (cases primitiva-doble prim
      (mayor-prim () (> exp1 exp2))
      (mayor-igual-prim () (>=  exp1 exp2))
      (menor-prim () (<  exp1 exp2))
      (menor-igual-prim () (<= exp1 exp2))
      )))

;;Procedimientos
(define-datatype procval procval?
  (clausura (lid (list-of symbol?))
            (body expresion?)
            (env ambiente?)))

#|
******************************************
;Booleanos

- true
- false
******************************************
;Condicionales
(condicional-exp) :=
if <expresion> then <expresion>  else <expresion> end


Debe probar
--> if >[2,3] then 2 else 3 end
3
******************************************

;Declaración de variables locales
(declare-exp) := 
declare (<identificador> = <expresion> ";") do <expresion> end

Debe probar

--> declare x=2;y=3;a=7 do +[a,-[x,y]] end
6
--> declarar x=2;y=3;a=7 haga a fin
7
--> declarar x=2;y=3 haga a fin
1
******************************************
declare
a = 3;
b = 4
do
letrec
f(x,y) = if >[x,0] then +[y,(f -[x,1] y)] else y end
do
(f 2 3)
end
*******************

|#

(interprete)