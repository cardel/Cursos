#lang eopl


;;REPRESENTACION BASADA EN DATATYPES

;;<lc-exp> ::= (var-exp) <identificador>
;;         ::= (lambda-exp) lambda ( <identificador> ) <lc-exp>
;;         ::= (app-exp) ( <lc-exp> <lc-exp>)

;;Representación basada en listas

;;Procedimientos: predicados, extractores -> observadores
;;

(define-datatype lc-exp lc-exp?
  (var-exp (id symbol?))
  (lambda-exp (id symbol?) (body lc-exp?))
  (app-exp (rator lc-exp?) (rand lc-exp?)))

(define exp1
  (lambda-exp 'x (app-exp (lambda-exp 'y (app-exp (var-exp 'x) (var-exp 'y)))
                          (var-exp 'y))))

(define occurs-free?
  (lambda (exp var)
    (cases lc-exp exp
      (var-exp (id) (equal? id var))
      (lambda-exp (id body)
                  (and
                   (not (equal? id var))
                   (occurs-free? body var)))
      (app-exp (rator rand)
               (or
                (occurs-free? rator var)
                (occurs-free? rand var))))))

(occurs-free? exp1 'x)
(occurs-free? exp1 'y)