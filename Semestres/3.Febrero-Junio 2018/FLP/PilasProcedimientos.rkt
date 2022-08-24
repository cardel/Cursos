#lang eopl

;Definiciones de procedimientos para pilas y colas

(define pila-vacia
  (lambda ()
         (lambda (s)
           (cond
             ;Mayor
             [(eqv? s 1) (eopl:error "error, es una pila vacia no pudo consultar el top")]
             ;Pop
             [(eqv? s 0) (eopl:error "pop, no pudo hacerlo")]
             ;PReguntar
             [(eqv? s 3) 'pila-vacia]
             ;TOp
             [else  -998989898]
               )
           )
         )
  )

(define pila-no-vacia
  (lambda (valor pila)
    (lambda (s)
      (cond
        [(eqv? s 1) valor]
        [(eqv? s 0) pila]
        [(eqv? s 3) 'pila-no-vacia]
        [else  (if (> valor (mayor pila)) valor (mayor pila))]
        )
      )
    )
  )

(define pila-vacia?
  (lambda (pila)
    (eqv? 'pila-vacia (pila 3))
    )
  )

(define pila-no-vacia?
  (lambda (pila)
    (eqv? 'pila-no-vacia (pila 3))))
    
(define pila->top
  (lambda (pila)
    (pila 1)
    )
  )

(define mayor
  (lambda (pila)
    (cond
      [(pila-vacia? pila) (eopl:error "Usted no puede sacar el mayor de una pila vacia")]
      [else (pila 2)])))

(define pila->pop
  (lambda (pila)
    (pila 0)
    )
 )
(define pila1
(pila-no-vacia 3 (pila-no-vacia 2 (pila-no-vacia -9 (pila-vacia)))))

(define pila2
  (pila-vacia))