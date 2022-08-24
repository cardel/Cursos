#lang eopl

(define lexica
  '(
    (espacio (whitespace) skip)
    (numero (digit (arbno digit)) number)
    (numero ("-" digit (arbno digit)) number)
    (numero (digit (arbno digit) "." digit (arbno digit)) number)
    (numero ("-" digit (arbno digit) "." digit (arbno digit)) number)
    (comentario (";;" (arbno (not #\newline))) skip)
    (identificador (letter (arbno (or letter "?" "!"))) symbol)
    (cadena ("'" letter (arbno (or letter "?" "!")) "'") string)
    )
  )
 
(define gramatical
  '(
    (programa (expresion) a-programa)
    (expresion (identificador) var-expresion)
    (expresion (numero) num-exp)
    (expresion (cadena) cadena-exp)
    (expresion (expresion-primitiva) prim-expresion)
    (expresion-primitiva (primitiva-unaria "[" expresion "]") prim-unaria)
    (expresion-primitiva (primitiva-mult "[" (separated-list expresion ",") "]") prim-mult)
    (expresion-primitiva (primitiva-par "[" expresion "," expresion "]") prim-pair)
    ;(expresion (primitiva "[" expresion (arbno "," expresion) prim-expresion)
    ;(expresion ("var" identificador declaracion ";") decl-vacia-exp )
    ;(declaracion () declaracion-vacia)
    ;(declaracion ("=" expresion) declaracion-no-vacia)
    (expresion("true")true-exp)
    (expresion("false")false-exp)
    (primitiva-mult ("+") sum-prim)
    (primitiva-mult ("-") menos-prim)
    (primitiva-mult ("/") div-prim)
    (primitiva-mult ("*") mul-prim)
    (primitiva-mult ("&") concat-prim)
    (primitiva-mult("and")and-prim)
    (primitiva-mult("or") or-prim)
    (primitiva-par ("%") mod-prim)
    (primitiva-unaria ("inc") inc-prim)
    (primitiva-unaria("not")not-prim)
    (primitiva-unaria ("dec") dec-prim)
    ))
 
;;Definir los datatype (estructra AST)
(sllgen:make-define-datatypes lexica gramatical)
 
(define scanner
   (sllgen:make-string-scanner lexica gramatical))
 
(define parser
  (sllgen:make-string-parser lexica gramatical))
 
(define interpretador
  (sllgen:make-rep-loop
           "x-x>"
           (lambda (pgm) (evaluar-programa pgm))
           (sllgen:make-stream-parser 
            lexica
            gramatical
            )
           )
  )
;Recibe un AST de programa y llama la función evaluar-expresion con la expresion interna
(define evaluar-programa
  (lambda (pgm)
    (cases programa pgm
      (a-programa (exp)
                  (evaluar-expresion exp init-env)))))
             
           
(define-datatype environment environment?
  (empty-env)
  (extend-env (lids (list-of symbol?))
              (lvalue (list-of value?))
              (old-env environment?)))
 
(define value?
  (lambda (x)
    (or (string? x) (number? x) (boolean? x))))
 
(define apply-env
  (lambda (env var)
    (cases environment env
      (empty-env () (eopl:error "No encuentro la variable" var))
      (extend-env (lid lval old-env)
                  (letrec
                      (
                       (buscar-posicion (lambda (lid var acc)
                                          (cond
                                            [(null? lid) -1]
                                            [(equal? var (car lid)) acc]
                                            [else (buscar-posicion (cdr lid) var (+ acc 1))]
                                            )))
                                            
                       )
                    (let
                        (
                         (posicion (buscar-posicion lid var 0))
                         )
                      (if
                       (not (= posicion -1))
                       (list-ref lval posicion)
                       (apply-env old-env var))))))))
                   
(define init-env
  (extend-env
   '(x y z)
   '(1 2 3)
   (extend-env
    '(a b c)
    '(4 5 6)
    (empty-env))
   ))
 
;;Esta función recibe un AST tipo expresión y lo procesa
(define evaluar-expresion
  (lambda (exp amb)
    (cases expresion exp
      (num-exp (dato) dato)
      (cadena-exp (dato) dato)
      (var-expresion (id) (apply-env amb id))
      (true-exp() #t)
      (false-exp()#f)
      (prim-expresion (exp-prim)
                      (cases expresion-primitiva exp-prim
                        (prim-mult (prim lst)
                                   (let
                                       (
                                        (lrands (map (lambda (x) (evaluar-expresion x amb)) lst))
                                        )
                                     (aplicar-primitiva prim lrands)
                                     )
                                   )                                   
                        (prim-pair (prim exp1 exp2)
                                   (let
                                       (
                                        (exp1E (evaluar-expresion exp1 amb))
                                        (exp2E (evaluar-expresion exp2 amb))
                                        )
                                     (cases primitiva-par prim
                                       (mod-prim () (modulo exp1E exp2E))
                                       )
                                     )
                                   )
                        (prim-unaria (prim exp)
 
                                     (let
                                         (
                                          (expE (evaluar-expresion exp amb))
                                          )
                                       (cases primitiva-unaria prim
                                         (inc-prim () (+ expE 1))
                                         (dec-prim () (- expE 1))
                                         (not-prim() (not expE))

                                         )
                                       )
                                     )))
      
      )
    )
  )
 
(define aplicar-primitiva
  (lambda (prim lrands)
    (cases primitiva-mult prim
      (sum-prim () (apply + lrands))
      (menos-prim ()(apply - lrands))
      (div-prim () (exact->inexact (apply / lrands)))
      (mul-prim ()(apply * lrands))
      (and-prim() (letrec
                         (
                          (funcion(lambda(lrand)
                                    (cond
                                      [(null? lrand)#t]
                                      [(and(eqv? (car lrand) #t)
                                           (funcion(cdr lrand)))]
                                      [else #f])))
                          )

                       (funcion lrands )))
      (or-prim() 
                        (letrec
                         (
                          (funcion2(lambda(lrand)
                                    (cond
                                      [(null? lrand)#f]
                                      [(or(eqv? (car lrand) #t)
                                           (funcion2(cdr lrand)))]
                                      [else #f])))
                          )

                       (funcion2 lrands )) )
      (concat-prim () (apply string-append lrands) )      
      )
    )
  )
 
(interpretador)
;
;(mod-prim () (modulo (car lrands) (cadr lrands))) ;;Operacion 2 argumentos
;(inc-prim () (+ (car lrands) 1)) ;;Operación recibe un argumento
;(dec-prim () (- (car lrands) 1)) ;;Operación recibe un argumento