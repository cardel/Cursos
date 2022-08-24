#lang eopl

;;3 de Junio de 2019
;; EJemplos de clase

(define nth-element
  (lambda (l n)
    (cond
      [(null? l) (eopl:error "El tamaño de la lista es menor al elemento solicitado")]
      [(= n 1) (car l)]
      [(nth-element (cdr l) (- n 1))]
      )
    )
  )


(define remove-first
  (lambda (l)
    (cond
      [(null? l) (eopl:error "La lista está vacía")]
      [(cdr l)]
      )
    )
  )


;;Procedimiento ocurre libre
;;Gramatica
;; <lambda-exp> := <identificador> | (lambda (<identificador>) <lambda-exp> | (<lambda-exp> <lambda-exp>)
(define occurs-free?
  (lambda (var exp)
    (cond
      [(symbol? exp) (eqv? var exp)]
      [(eqv? (car exp) 'lambda)
       (if (not (eqv? var (caadr exp))) (occurs-free? var (caddr exp))
           #F)]
      [else (or
             (occurs-free? var (car exp))
             (occurs-free? var (cadr exp)))
            ]
      )
    )
  )

(occurs-free? 'x '(lambda (y) (x y)))
(occurs-free? 'x '((lambda (x) x) (lambda (y) x)))
(occurs-free? 'x '((lambda (x) x) (lambda (y) (lambda (x) y))))
(occurs-free? 'y '((lambda (x) y) (lambda (y) (lambda (x) y))))
       