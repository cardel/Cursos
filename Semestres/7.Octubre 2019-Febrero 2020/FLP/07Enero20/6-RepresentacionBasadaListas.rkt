#lang eopl
;;REPRESENTACION BASADA EN LISTAS
;;<lc-exp> ::= (var-exp) <identificador>
;;         ::= (lambda-exp) lambda ( <identificador> ) <lc-exp>
;;         ::= (app-exp) ( <lc-exp> <lc-exp>)

;;Representación basada en listas

;;Procedimientos: predicados, extractores -> observadores
;;                constructores

(define var-exp
  (lambda (id)
    (list 'var-exp id)))

(define lambda-exp
  (lambda (id exp)
    (list 'lambda-exp id exp)))

(define app-exp
  (lambda (rator rand)
    (list 'app-exp rator rand)))

;;Predicados

(define var-exp?
  (lambda (exp)
    (equal? (car exp) 'var-exp)))

(define lambda-exp?
  (lambda (exp)
    (equal? (car exp) 'lambda-exp)))

(define app-exp?
  (lambda (exp)
    (equal? (car exp) 'app-exp)))

;;Extractores

(define var-exp->id
  (lambda (exp)
    (cadr exp)))

(define lambda-exp->id
  (lambda (exp)
    (cadr exp)))

(define lambda-exp->body
  (lambda (exp)
    (caddr exp)))

(define app-exp->rator
  (lambda (exp)
    (cadr exp)))

(define app-exp->rand
  (lambda (exp)
    (caddr exp)))

;;Area del programador

(define occurs-free?
  (lambda (exp var)
    (cond
      [(var-exp? exp) (equal? (var-exp->id exp) var) ]
      [(lambda-exp? exp)
       (and
        (not (equal? (lambda-exp->id exp) var))
        (occurs-free? (lambda-exp->body exp) var))]
      [(app-exp? exp)
       (or
        (occurs-free? (app-exp->rator exp) var)
        (occurs-free? (app-exp->rand exp) var))]
      [else
       (eopl:error "No es una expresión válida")])))


(define exp1
  (lambda-exp 'x (app-exp (lambda-exp 'y (app-exp (var-exp 'x) (var-exp 'y)))
                          (var-exp 'y))))

(occurs-free? exp1 'x)
(occurs-free? exp1 'y)