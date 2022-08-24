#lang eopl
(define especificacion-lexica
  '(
    (espacio-blanco (whitespace) skip)
    (comentario ("%" (arbno (not #\newline))) skip)
    (identificador (letter (arbno (or letter digit "?" "$"))) symbol)
    (numero (digit (arbno digit)) number)
    (numero ("-" digit (arbno digit)) number)
    (numero (digit (arbno digit)"." digit (arbno digit)) number)
    (numero ("-" digit (arbno digit)"." digit (arbno digit)) number)
    )
  )


(define especificacion-gramatical
  '(
    (programa (expresion) a-program)
    (expresion (numero) lit-exp)
    (expresion (identificador) var-exp)
    ;;Agregamos la gramática de los condicionales y las ligaduras
    (expresion ("true") true-exp)
    (expresion ("false") false-exp)
    (expresion ("if" expresion "then" expresion "else" expresion) if-exp)
    ;;Ligaduras locales
    (expresion ("let" (arbno identificador "=" expresion) "in" expresion) let-exp)
    ;;Fin de condicionales y ligaduras
    ;;procedimientos
    (expresion ("proc" "(" (separated-list identificador ",") ")" expresion) proc-exp)
    (expresion ("(" expresion (arbno expresion) ")") app-exp)
    (expresion ("[" (separated-list expresion ",") "]") list-exp)
    ;;fin procedimientos
    ;;procedimientos recursivos
    (expresion ("letrec" (arbno identificador "(" (separated-list identificador ",") ")" "=" expresion) "in" expresion) letrec-exp) 
    ;;fin de procedimientos recursivos

    ;;Asignación
    (expresion ("begin" expresion (arbno ";" expresion) "end") begin-exp)
    (expresion ("set" identificador "=" expresion) set-exp)

    ;;Primitivas
    (expresion (primitiva "(" (separated-list expresion ",") ")") prim-exp)
    (primitiva ("+") sum-prim)
    (primitiva ("-") minus-prim)
    (primitiva ("*") mult-prim)
    (primitiva ("/") div-prim)
    (primitiva ("add1") add-prim)
    (primitiva ("sub1") sub-prim)
    ;;primitivas booleanas
    (primitiva (">") mayor-prim)
    (primitiva (">=") mayorigual-prim)
    (primitiva ("<") menor-prim)
    (primitiva ("<=") menorigual-prim)
    (primitiva ("==") igual-prim)

    )
  )

;;Creamos los datatypes automaticamente
(sllgen:make-define-datatypes especificacion-lexica especificacion-gramatical)


;;Evaluar programa
(define evaluar-programa
  (lambda (pgm)
    (cases programa pgm
      (a-program (exp) (evaluar-expresion exp ambiente-inicial))
      ))
  )

;;ambientes
(define-datatype ambiente ambiente?
  (ambiente-vacio)
  (ambiente-extendido-ref
   (lids (list-of symbol?))
   (lvalue vector?)
   (old-env ambiente?)))

(define ambiente-extendido
  (lambda (lids lvalue old-env)
    (ambiente-extendido-ref lids (list->vector lvalue) old-env)))

;;Implementación ambiente extendido recursivo

(define ambiente-extendido-recursivo
  (lambda (procnames lidss cuerpos old-env)
    (let
        (
         (vec-clausuras (make-vector (length procnames)))
         )
      (letrec
          (
           (amb (ambiente-extendido-ref procnames vec-clausuras old-env))
           (obtener-clausuras
            (lambda (lidss cuerpos pos)
              (cond
                [(null? lidss) amb]
                [else
                 (begin
                   (vector-set! vec-clausuras pos
                                (direct-target (closure (car lidss) (car cuerpos) amb)))
                   (obtener-clausuras (cdr lidss) (cdr cuerpos) (+ pos 1)))]
                )
              )
            )
           )
        (obtener-clausuras lidss cuerpos 0)
        )
      )
    )
  )


(define apply-env
  (lambda (env var)
    (deref (apply-env-ref env var))))


(define apply-env-ref
  (lambda (env var)
    (cases ambiente env
      (ambiente-vacio () (eopl:error "No se encuentra la variable " var))
      (ambiente-extendido-ref (lid vec old-env)
                          (letrec
                              (
                               (buscar-variable (lambda (lid vec pos)
                                                  (cond
                                                    [(null? lid) (apply-env-ref old-env var)]
                                                    [(equal? (car lid) var) (a-ref pos vec)]
                                                    [else
                                                     (buscar-variable (cdr lid) vec (+ pos 1)  )]
                                                    )
                                                  )
                                                )
                               )
                            (buscar-variable lid vec 0)
                            )
                          
                          )
      
      )
    )
  )


;;Evaluar expresion
(define evaluar-expresion
  (lambda (exp amb)
    (cases expresion exp
      (lit-exp (dato) dato)
      (var-exp (id) (apply-env amb id))
      ;;Booleanos
      (true-exp () #true)
      (false-exp () #false)
      ;;Fin booleanos
      (prim-exp (prim args)
                (let
                    (
                     (lista-numeros (map (lambda (x) (evaluar-expresion x amb)) args))
                     )
                  (evaluar-primitiva prim lista-numeros)
                  )
                )
      ;;Condicionales
      (if-exp (condicion hace-verdadero hace-falso)
              (if
               (evaluar-expresion condicion amb) ;;Evaluamos la condición
               (evaluar-expresion hace-verdadero amb) ;;En caso de que sea verdadero
               (evaluar-expresion hace-falso amb) ;;En caso de que sea falso
               )
              )
      ;;Ligaduras locales
      (let-exp (ids rands body)
               (let
                   (
                    (lvalues (map (lambda (x) (direct-target (evaluar-expresion x amb))) rands))
                    )
                 (evaluar-expresion body (ambiente-extendido ids lvalues amb))
                 )
               )
      ;;procedimientos
      (proc-exp (ids body)
                (closure ids body amb))
      (app-exp (rator rands)
               (let
                   (
                    (lrands (map (lambda (x) (eval-rand x amb)) rands))
                    (procV (evaluar-expresion rator amb))
                    )
                 (if
                  (procval? procV)
                  (cases procval procV
                    (closure (lid body old-env)
                             (if (= (length lid) (length lrands))
                                 (evaluar-expresion body
                                                (ambiente-extendido lid lrands old-env))
                                 (eopl:error "El número de argumentos no es correcto, debe enviar" (length lid)  " y usted ha enviado" (length lrands))
                                 )
                             ))
                  (eopl:error "No puede evaluarse algo que no sea un procedimiento" procV) 
                  )
                 )
               )

      ;;letrec
      (letrec-exp (procnames idss cuerpos cuerpo-letrec)
                  (evaluar-expresion cuerpo-letrec
                                     (ambiente-extendido-recursivo procnames idss cuerpos amb)))

      ;;listas
      (list-exp (lexp) (map (lambda (x) (evaluar-expresion x amb)) lexp))
      ;;Asignación
      ;;begin
      (begin-exp (exp lexp)
                 (if
                  (null? lexp)
                  (evaluar-expresion exp amb)
                  (begin
                    (evaluar-expresion exp amb)
                    (letrec
                        (
                         (evaluar-begin (lambda (lexp)
                                          (cond
                                            [(null? (cdr lexp)) (evaluar-expresion (car lexp) amb)]
                                            [else
                                             (begin
                                               (evaluar-expresion (car lexp) amb)
                                               (evaluar-begin (cdr lexp))
                                               )
                                             ]
                                            )
                                          )
                                        )
                         )
                      (evaluar-begin lexp)
                      )
                    )
                  )
                 )
      ;;set
      (set-exp (id exp)
               (begin
                 (setref!
                  (apply-env-ref amb id)
                  (evaluar-expresion exp amb))
                 1)
               )
      )
    

    )
  )

;;Manejo de primitivas
(define evaluar-primitiva
  (lambda (prim lval)
    (cases primitiva prim
      (sum-prim () (operacion-prim lval + 0))
      (minus-prim () (operacion-prim lval - 0))
      (mult-prim () (operacion-prim lval * 1))
      (div-prim () (operacion-prim lval / 1))
      (add-prim () (+ (car lval) 1))
      (sub-prim () (- (car lval) 1))
      (mayor-prim () (> (car lval) (cadr lval)))
      (mayorigual-prim () (>= (car lval) (cadr lval)))
      (menor-prim () (< (car lval) (cadr lval)))
      (menorigual-prim () (<= (car lval) (cadr lval)))
      (igual-prim () (= (car lval) (cadr lval)))
      )
    )
  )


(define operacion-prim
  (lambda (lval op term)
    (cond
      [(null? lval) term]
      [else
       (op
        (car lval)
        (operacion-prim (cdr lval) op term))
       ]
      )
    )
  )

;;Definiciones para los procedimientos
(define-datatype procval procval?
  (closure (lid (list-of symbol?))
           (body expresion?)
           (amb-creation ambiente?)))

;;Referencias

(define-datatype referencia referencia?
  (a-ref (pos number?)
         (vec vector?)))

;;Extractor de referencias
(define deref
  (lambda (ref)
    (cases target (primitiva-deref ref)
      (direct-target (exp) exp)
      (indirect-target (ref1)
                       (cases target (primitiva-deref ref1)
                         (direct-target (exp1) exp1)
                         (indirect-target (p) (eopl:error "La referencia no es válida" ref1)))))))

(define primitiva-deref
  (lambda (ref)
    (cases referencia ref
      (a-ref (pos vec)
             (vector-ref vec pos)))))

;;Asignación/cambio referencias
(define setref!
  (lambda (ref val)
    (let
        (
         (ref1 (cases target (primitiva-deref ref)
                 (direct-target (exp) ref)
                 (indirect-target (ref2) ref2)
                 )
               )
         )
      (primitiva-setref! ref1 (direct-target val))
      )))

(define primitiva-setref!
  (lambda (ref val)
    (cases referencia ref
      (a-ref (pos vec)
             (vector-set! vec pos val)))))


;;Paso por referencia

(define-datatype target target?
  (direct-target (expval expval?))
  (indirect-target (ref ref-to-direct-target?)))

(define expval?
  (lambda (x)
    (or (boolean? x) (number? x) (procval? x))))

(define ref-to-direct-target?
  (lambda (x)
    (and (referencia? x)
         (cases referencia x
           (a-ref (pos vec)
                  (cases target (vector-ref vec pos)
                    (direct-target (v) #t)
                    (indirect-target (v) #f)))))))
         
;;Paso por referencia, aplicacion de procedimientos

(define eval-rand
  (lambda (exp amb)
    (cases expresion exp
      (var-exp (id)
               (indirect-target
                (let
                    (
                     (ref (apply-env-ref amb id))
                     )
                  (cases target (primitiva-deref ref)
                    (direct-target (expval) ref)
                    (indirect-target (ref1) ref1))
                  )
                )
               )
      (else
       (direct-target (evaluar-expresion exp amb)))
                  
      )
    )
  )
                

;;Interpretador
(define interpretador
  (sllgen:make-rep-loop "-->" evaluar-programa
                        (sllgen:make-stream-parser
                         especificacion-lexica especificacion-gramatical)))

(define ambiente-inicial
  (ambiente-extendido '(x y z) (list (direct-target 1) (direct-target 2) (direct-target 3))
                      (ambiente-extendido '(a b c) (list (direct-target 4) (direct-target 5) (direct-target 6))
                                          (ambiente-vacio))))



(interpretador)