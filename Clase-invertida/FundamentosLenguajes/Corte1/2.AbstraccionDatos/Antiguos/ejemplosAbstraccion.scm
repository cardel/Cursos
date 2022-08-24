;*************Interfaz + *********************
(define zero '())
(define iszero? null?)
(define succ (lambda (rep_n) (cons #t rep_n)))
(define pred cdr)

;*************Implementacion***************
(lambda (list-16)
  (if (null? list-16)
      (list 1)
      ( if (= 16 (+ 1 (car list-16)))
           (cons 0 (succ (cdr list)))
           (cons (+ 1 (car list-16)) (cdr list-16))
      
      )
   )
  )
;*************Aplicación*******************

;plus: |natural| |natural| -> natural

(define plus
  (lambda (x y)
    (if (iszero? x)
        y
        (succ (plus (pred x) y))
        )))

(define prod
  (lambda (x y)
    (if (iszero? x)
        zero
        (if (eqv? x (succ zero))
            y
            (plus y (prod (pred x)  y))
            ))))

;*************************************************
;Ejemplo de arbol binario:

;; un arbol binario es:
;; - <numero>
;; - (cons <simbolo> <arbin>)
;; Escrito en BNF:
; <arbin> ::= <numero>
; <arbin> ::= (<simbolo> <arbin> <arbin>)

;; Example Trees:
(define tree-1 2) ;; una hoja
(define tree-2 3) ;; otra hoja 
(define tree-3 (list 'a 1 5)) ;; un nodo con dos hojas

(define tree-4 (list 'b tree-3 tree-2))


;; cuantos: <arbin> -> numero
;; retorna la cantidad de nodos que contiene un arbol binario 
(define cuantos
  (lambda (arbin)
    (if (number? arbin)
        1
        (+ 1 (cuantos (cadr arbin)) (cuantos (caddr arbin)) )
        )
    )
)

;******************************************************************
;ejemplo de lista-s
;Gramática en BNF (tomada de pag 19 de EoPL)
; <listas>           ::=()
;                    ::= (<expresion-simbolo> . <listas>)
; <expresion-simbolo>::= <simbolo> | <listas>

;subst: <listas> <simbolo> <simbolo> -> <listas>
; (subst <listas> new old)
; función que substituye toda aparición de new por old en la lista
; de entrada

(define subst
  (lambda (listas old new)
    (if (null? listas)
        '()
        (cons (subst-exp-sim (car listas) old new) (subst (cdr listas)) old new)
        )
    ))

(define subst-exp-sim
  (lambda (exp-sim  old new)
    (if (symbol? exp-sim)
        (if (eqv? exp-sim old) new exp-sim)
        (subst exp-sim old new)
        )
    ))

;************************************************************
;Ejemplos de define-datatype

(define-datatype arbin arbin? ; instrucción para definir, nombre del tipo, predicado
  (hoja (n number?))          ; puede ser una hoja, nombre n, de tipo numero, ó
  (nodo                       ; puede ser de tipo nodo con:
   (letra symbol?)            ; - un campo llamado letra, de tipo símbolo
   (izq arbin?)               ; - un campo llamado izq de tipo arbin
   (der arbin?)               ; - y un campo llamado der de tipo arbin
   )  
 )

; Por medio de esta instrucción se creo un tipo de dato llamado
; arbin con la siguiente interfaz:
; 1. un procedimiento llamado arbin? que permite determinar
;    si una entrada es de tipo arbin
; 2. un procedimiento llamado hoja, que permite crear un arbol 
;    binario que sea una hoja, toma como entrada un número
; 3. un procedimiento llamado nodo, que permite crear un arbol 
;    binario que sea de tipo nodo, toma tre entradas: un símbolo, 
;     y dos arboles binarios.

;Ejemplos de la interfaz
(define arbin1 (hoja 1)) ;; una hoja
(define arbin2 (hoja 3)) ;; otra hoja 
(define arbin3 (nodo 'a  (hoja 2)  (hoja 5))) ;; un nodo con dos hojas

;(define arbin3 (nodo 'a  2  5)) ;; un nodo con dos hojas

(define arbin4 (nodo 'b arbin2 arbin3))

(arbin? (list 'a 2 3))
(arbin? arbin1)

;*****************************************************************
; Ejemplo tipo de dato listas

(define-datatype s-list s-list?
  (empty-s-list)
  (non-empty-s-list
   (first symbol-exp?)
   (rest s-list?)))


(define-datatype symbol-exp symbol-exp?
  (symbol-symbol-exp (data symbol?))
  (s-list-symbol-exp (data s-list?)))

;*******************************************************************
;Ejemplo cases
      
;(cases nombre-tipo expresión                     
;  {(nombre-variante ({nombre-campo } ) consecuente )}
;  (else por-defecto ) 
;  )

(define cuantos-cases
  (lambda (un-arbin)
    (cases arbin un-arbin
      (hoja (n) 1)
      (nodo (le izq der) (+ 1 (cuantos-cases izq) (cuantos-cases der)))
   
      )
   )
)
    
;*******************************************************
;ejemplo cases y gramática de la expresión lambda
;gramática:
;<expresion> ::= <identificador> 
;            ::= (lambda (<identificador>) <expresion>)
;            ::= (<expresion> <expresion>)

;Plantilla define-datatype
;(define-datatype nombre-tipo nombre-predicado-tipo
;{(nombre-variante {(nombre-campo predicado )}* )}*
;  )

;(cases nombre-tipo expresión                     
;  {(nombre-variante ({nombre-campo } ) consecuente )}
;  (else por-defecto ) 
;  )



;*************************************************
;Ejemplo expresiones lambda

(define-datatype expression expression? 
  (var-exp
    (id symbol?))
  (lambda-exp
    (id symbol?)
    (body expression?))
  (app-exp
    (rator expression?)
    (rand expression?)))

(define occurs-free?
  (lambda (var exp)
    (cases expression exp
      (var-exp (id) (eqv? id var))
      (lambda-exp (id body)
        (and (not (eqv? id var))
             (occurs-free? var body)))
      (app-exp (rator rand)
        (or (occurs-free? var rator)
            (occurs-free? var rand))))))


(define unparse-expression
  (lambda (exp)
    (cases expression exp
      (var-exp (id) id)
      (lambda-exp (id body) 
        (list 'lambda (list id)
          (unparse-expression body)))
      (app-exp (rator rand)
        (list (unparse-expression rator)
              (unparse-expression rand))))))
;
(define parse-expression
  (lambda (datum)
    (cond
      ((symbol? datum) (var-exp datum))
      ((pair? datum)
       (if (eqv? (car datum) 'lambda)
         (lambda-exp (caadr datum)
           (parse-expression (caddr datum)))
         (app-exp
           (parse-expression (car datum))
           (parse-expression (cadr datum)))))
      (else (eopl:error 'parse-expression
              "Invalid concrete syntax ~s" datum)))))

(define exp1 (var-exp 'x))
 (define exp2 (var-exp 'f))
 (define exp3 (app-exp exp2 exp1))
 (define exp4 (app-exp exp2 exp3))
 
 (define exp5 (lambda-exp 'x exp4))