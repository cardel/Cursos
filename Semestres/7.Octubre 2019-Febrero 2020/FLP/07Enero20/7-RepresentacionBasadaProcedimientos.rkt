#lang eopl
;;REPRESENTACION BASADA EN PROCEDIMIENTOS

;;<lc-exp> ::= (var-exp) <identificador>
;;         ::= (lambda-exp) lambda ( <identificador> ) <lc-exp>
;;         ::= (app-exp) ( <lc-exp> <lc-exp>)

;;Representación basada en listas

;;Procedimientos: predicados, extractores -> observadores
;;


(define var-exp
  (lambda (id)
    (lambda (signal)
      (cond
        [(= signal 0) 'var-exp]
        [(= signal 1) id]
        [else (eopl:error "Señal no válida en var-exp")]))))


(define lambda-exp
  (lambda (id body)
    (lambda (signal)
      (cond
        [(= signal 0) 'lambda-exp]
        [(= signal 1) id]
        [(= signal 2) body]
        [else (eopl:error "Señal no válida en lambda-exp")]
        ))))

(define app-exp
  (lambda (rator rand)
    (lambda (signal)
      (cond
        [(= signal 0) 'app-exp]
        [(= signal 1) rator]
        [(= signal 2) rand]
        [else (eopl:error "Señal no válida en app-exp")]))))

;;;Observadores: Predicados y extractores

(define var-exp?
  (lambda (exp)
    (equal? (exp 0) 'var-exp)))

(define lambda-exp?
  (lambda (exp)
    (equal? (exp 0) 'lambda-exp)))

(define app-exp?
  (lambda (exp)
    (equal? (exp 0) 'app-exp)))

(define var-exp->id
  (lambda (exp)
    (exp 1)))

(define lambda-exp->id
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

