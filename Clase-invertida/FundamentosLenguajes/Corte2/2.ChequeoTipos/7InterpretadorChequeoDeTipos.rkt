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
    ;;Fin de condicionales y ligaduras (tipos)
    ;;procedimientos
    (expresion ("proc" "(" (separated-list type-exp identificador ",") ")" expresion) proc-exp)
    (expresion ("(" expresion (arbno expresion) ")") app-exp)

    ;;fin procedimientos
    ;;procedimientos recursivos
    (expresion ("letrec" (arbno type-exp identificador "(" (separated-list type-exp identificador ",") ")" "=" expresion) "in" expresion) letrec-exp) 
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

    ;;tipos
    (type-exp ("int") int-type-exp)
    (type-exp ("bool") bool-type-exp)
    (type-exp ("(" (separated-list type-exp "*") "->" type-exp")") proc-type-exp)
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
                                (closure (car lidss) (car cuerpos) amb))
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

(define ambiente-inicial
  (ambiente-extendido '(x y z) '(4 2 5)
                      (ambiente-extendido '(a b c) '(4 5 6)
                                          (ambiente-vacio))))

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
                    (lvalues (map (lambda (x) (evaluar-expresion x amb)) rands))
                    )
                 (evaluar-expresion body (ambiente-extendido ids lvalues amb))
                 )
               )
      ;;procedimientos
      (proc-exp (texp ids body)
                (closure ids body amb))
      (app-exp (rator rands)
               (let
                   (
                    (lrands (map (lambda (x) (evaluar-expresion x amb)) rands))
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
      (letrec-exp (result-types procnames tidss idss cuerpos cuerpo-letrec)
                  (evaluar-expresion cuerpo-letrec
                                     (ambiente-extendido-recursivo procnames idss cuerpos amb)))

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
    (primitiva-deref ref)))

(define primitiva-deref
  (lambda (ref)
    (cases referencia ref
      (a-ref (pos vec)
             (vector-ref vec pos)))))

;;Asignación/cambio referencias
(define setref!
  (lambda (ref val)
    (primitiva-setref! ref val)))

(define primitiva-setref!
  (lambda (ref val)
    (cases referencia ref
      (a-ref (pos vec)
             (vector-set! vec pos val)))))


(define aux-interpretador
  (lambda (x)
    (if (type? (type-of-program x)) (evaluar-programa  x) 'error)))

;;Interpretador
(define interpretador
  (sllgen:make-rep-loop "-->" aux-interpretador
                        (sllgen:make-stream-parser
                         especificacion-lexica especificacion-gramatical)))





(define type-of-program
  (lambda (pgm)
    (cases programa pgm
      (a-program (exp) (type-of-expression exp (empty-tenv))))))

;;Checker
(define type-of-expression
         (lambda (exp tenv)
           (cases expresion exp
             (lit-exp (dato) int-type)
             (var-exp (id) (apply-tenv tenv id))
             ;;Booleanos
             (true-exp () bool-type)
             (false-exp () bool-type)
             (if-exp (test-exp true-exp false-exp)
                     (let
                         (
                          (type-test (type-of-expression test-exp tenv))
                          (type-true (type-of-expression true-exp tenv))
                          (type-false (type-of-expression false-exp tenv))
                          )
                       (begin
                         (check-equal-type! type-test bool-type exp)
                         (check-equal-type! type-true type-false exp)
                         type-true
                         )
                       )
                     )
             (proc-exp (texp ids body)
                       (type-of-proc-exp texp ids body tenv))

             (app-exp (rator rands)
               (type-of-application
                (type-of-expression rator tenv)
                (types-of-expressions rands tenv)
                rator
                rands
                exp))
             (prim-exp (prim rands)
                       (type-of-application
                        (type-of-primitive prim rands)
                        (types-of-expressions rands tenv)
                        prim rands exp))                      
             (let-exp (ids rands body)
               (type-of-let-exp ids rands body tenv))                       
             (letrec-exp (result-texps proc-names texpss idss bodies letrec-body)
                  (type-of-letrec-exp result-texps proc-names texpss idss bodies
                                      letrec-body tenv))
             (begin-exp (exp lexp)
                        (if (null? lexp)
                            (type-of-expression exp tenv)
                            (letrec
                                (
                                 (evaluar-tipos (lambda (lexpI)
                                                  (cond
                                                    [(null? (cdr lexpI)) (type-of-expression (car lexpI) tenv)]
                                                    [else
                                                     (begin
                                                       (type-of-expression (car lexpI) tenv)
                                                       (evaluar-tipos (cdr lexpI))
                                                       )
                                                     ])))
                                 )
                              (begin
                                (type-of-expression exp tenv)
                                (evaluar-tipos lexp)
                                )
                              )
                            )
                        )
             (set-exp (id exp) int-type)
             
             )))



; función que mapea la función type-of-expresion a una lista
(define types-of-expressions
  (lambda (rands tenv)
    (map (lambda (exp) (type-of-expression exp tenv)) rands)))

; verifica si dos tipos son iguales, muestra un mensaje de error en caso de que no lo sean
(define check-equal-type!
  (lambda (t1 t2 exp)
    (if (not (equal? t1 t2))
        (eopl:error "Los tipos no corresponden ~s != ~s in ~%~s"
                    t1 t2 exp)
        #true
        )
    ))

(define type-to-external-form
  (lambda (ty)
    (cases type ty
      (atomic-type (name) name)
      (proc-type (arg-types result-type)
                 (append
                  (arg-types-to-external-form arg-types)
                  '(->)
                  (list (type-to-external-form result-type)))))))


(define arg-types-to-external-form
  (lambda (types)
    (if (null? types)
        '()
        (if (null? (cdr types))
            (list (type-to-external-form (car types)))
            (cons
             (type-to-external-form (car types))
             (cons '*
                   (arg-types-to-external-form (cdr types))))))))


; función auxiliar para determinar el tipo de una expresión de creación de procedimiento
(define type-of-proc-exp
  (lambda (texps ids body tenv)
    (let ((arg-types (expand-type-expressions texps)))
      (let ((result-type
             (type-of-expression body
                                 (extend-tenv ids arg-types tenv))))
        (proc-type arg-types result-type)))))


; función auxiliar para determinar el tipo de una expresión de aplicación
(define type-of-application
  (lambda (rator-type rand-types rator rands exp)
    (cases type rator-type
      (proc-type (arg-types result-type)
                 (if (= (length arg-types) (length rand-types))
                     (begin
                       (for-each
                        check-equal-type!
                        rand-types arg-types rands)
                       result-type)
                     (eopl:error 'type-of-expression
                                 (string-append
                                  "Wrong number of arguments in expression ~s:"
                                  "~%expected ~s~%got ~s")
                                 exp
                                 (map type-to-external-form arg-types)
                                 (map type-to-external-form rand-types))))
      (else
       (eopl:error 'type-of-expression
                   "Rator not a proc type:~%~s~%had rator type ~s"
                   rator (type-to-external-form rator-type))))))


(define type-of-primitive
  (lambda (prim rands)
    (cases primitiva prim
      ;;primitivas numericas
      (sum-prim () (proc-type (primitive-numeric rands) int-type))
      (minus-prim () (proc-type (primitive-numeric rands) int-type))
      (mult-prim () (proc-type (primitive-numeric rands) int-type))
      (div-prim () (proc-type (primitive-numeric rands) int-type))
      ;primitivas numericas unarias
      (add-prim () (proc-type (list int-type) int-type))
      (sub-prim () (proc-type (list int-type) int-type))
      ;;primitivas booleanas
      (mayor-prim () (proc-type (list int-type int-type) bool-type))
      (mayorigual-prim () (proc-type (list int-type int-type) bool-type))
      (menor-prim () (proc-type (list int-type int-type) bool-type))
      (menorigual-prim () (proc-type (list int-type int-type) bool-type))
      (igual-prim () (proc-type (list int-type int-type) bool-type))
      )
    )
  )


(define primitive-numeric
  (lambda (rands)
    (cond
      [(null? rands) '()]
      [else (cons int-type (primitive-numeric (cdr rands)))]
      )))

; función auxiliar para determinar el tipo de una expresión let
(define type-of-let-exp
  (lambda (ids rands body tenv)
    (let ((tenv-for-body
           (extend-tenv
            ids
            (types-of-expressions rands tenv)
            tenv)))
      (type-of-expression body tenv-for-body))))

; función auxiliar para determinar el tipo de una expresión letrec
(define type-of-letrec-exp
  (lambda (result-texps proc-names texpss idss bodies letrec-body tenv)
    (let ((arg-typess (map (lambda (texps)
                             (expand-type-expressions texps))
                           texpss))
          (result-types (expand-type-expressions result-texps)))
      (let ((the-proc-types
             (map proc-type arg-typess result-types)))
        (let ((tenv-for-body
               (extend-tenv proc-names the-proc-types tenv)))
          (for-each
           (lambda (ids arg-types body result-type)
             (check-equal-type!
              (type-of-expression
               body
               (extend-tenv ids arg-types tenv-for-body))
              result-type
              body))
           idss arg-typess bodies result-types)
          (type-of-expression letrec-body tenv-for-body))))))


;;Ambientes de tipos
(define-datatype type-environment type-environment?
  (empty-tenv-record)
  (extended-tenv-record
    (syms (list-of symbol?))
    (vals (list-of type?))
    (tenv type-environment?)))

(define empty-tenv empty-tenv-record)
(define extend-tenv extended-tenv-record)

(define apply-tenv 
  (lambda (tenv sym)
    (cases type-environment tenv
      (empty-tenv-record ()
        (eopl:error 'apply-tenv "Unbound variable ~s" sym))
      (extended-tenv-record (syms vals env)
        (let ((pos (list-find-position sym syms)))
          (if (number? pos)
            (list-ref vals pos)
            (apply-tenv env sym)))))))

; funciones auxiliares para encontrar la posición de un símbolo
; en la lista de símbolos de unambiente

(define list-find-position
  (lambda (sym los)
    (list-index (lambda (sym1) (eqv? sym1 sym)) los)))

(define list-index
  (lambda (pred ls)
    (cond
      ((null? ls) #f)
      ((pred (car ls)) 0)
      (else (let ((list-index-r (list-index pred (cdr ls))))
              (if (number? list-index-r)
                (+ list-index-r 1)
                #f))))))


;;Tipos
(define-datatype type type?
  (atomic-type (name symbol?))
  (proc-type
   (arg-type (list-of type?))
   (result-type type?)))

(define int-type (atomic-type 'int))
(define bool-type (atomic-type 'bool))

(define expand-type-expression
  (lambda (texp)
    (cases type-exp texp
      (int-type-exp () int-type)
      (bool-type-exp () bool-type)
      (proc-type-exp (arg-texp result-texp)
                     (proc-type
                      (expand-type-expressions arg-texp)
                      (expand-type-expression result-texp))))))

(define expand-type-expressions
  (lambda (arg-texp)
    (map (lambda (x) (expand-type-expression x)) arg-texp)))

(interpretador)