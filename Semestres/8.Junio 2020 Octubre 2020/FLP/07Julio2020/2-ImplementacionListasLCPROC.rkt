#lang eopl
;;REPRESENTACION BASADA EN PROCEDIMIENTOS

;;CONSTRUCTORES
;; Señal 0 es para preguntar que tipo de dato es var-exp? app-exp? lambda-exp?
;; Señal 1 es para extraer el primer dato
;; Señal 2 es para extraer el segundo dato
(define var-exp
  (lambda (id)
    (lambda (signal)
      (cond
        [(= signal 0) 'var-exp]
        [(= signal 1) id]
        [else (eopl:error "Error de implementación")]))))
    

(define lambda-exp
  (lambda (id body)
    (lambda (signal)
      (cond
        [(= signal 0) 'lambda-exp]
        [(= signal 1) id]
        [(= signal 2) body]
        [else (eopl:error "Error de implementación")]))))
      

(define app-exp
  (lambda (rator rand)
    (lambda (signal)
      (cond
        [(= signal 0) 'app-exp]
        [(= signal 1) rator]
        [(= signal 2) rand]
        [else (eopl:error "Error de implementación")]))))

;PROCEDIMIENTOS OBSERVADORES

;;PREDICADOS
(define var-exp?
  (lambda (exp)
    (equal? (exp 0) 'var-exp)))

(define lambda-exp?
  (lambda (exp)
    (equal? (exp 0) 'lambda-exp)))
    
(define app-exp?
  (lambda (exp)
    (equal? (exp 0) 'app-exp)))

;;EXTRACTORES

(define var-exp->var
  (lambda (exp)
    (exp 1)))

(define lambda-exp->bound-var
  (lambda (exp)
    (exp 1)))

(define lambda-exp->body
  (lambda (exp)
    (exp 2)))

(define app-exp->rator
  (lambda (exp)
    (exp 1)))

(define app-exp->rand
  (lambda (exp)
    (exp 2)))

;;AREA DEL PROGRAMADOR

(define exp1
  (lambda-exp 'x
              (app-exp
               (var-exp 'y)
               (app-exp
                (lambda-exp 'x (var-exp 'x))
                (app-exp (var-exp 'y) (lambda-exp 'y (var-exp 'x)))))))

;;Ocurre libre??

;1. Si la expresión es tipo var-exp, la variable buscada es igual igual a la expresión
;2. Si es un lambda-exp, esta deber ser diferente del id y ocurrir libre en el cuerpo
;3. Si es un app-exp esta debe ocurrir libre en el rator o en el rand

(define ocurre-libre?
  (lambda (exp var)
    (cond
      [(var-exp? exp) (equal? var (var-exp->var exp))]
      [(lambda-exp? exp)
       (and
        (not (equal? var (lambda-exp->bound-var exp)))
        (ocurre-libre? (lambda-exp->body exp) var))]
      [(app-exp? exp)
       (or
        (ocurre-libre? (app-exp->rator exp) var)
        (ocurre-libre? (app-exp->rand exp) var))]
      [else
       (eopl:error "Problema de sintaxis de la expresión")])))
