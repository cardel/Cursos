#lang eopl

;;Gramática del arbol ternario
;; <arbol-ternario> ::= <hoja> numero
;;                  ::= <nodo> simbolo <arbol-ternario> <arbol-ternario> <arbol-ternario>


;;Procedimientos constructores
(define hoja
  (lambda (num)
    (list 'hoja num)
    )
  )

(define nodo
  (lambda (key hi1 hi2 hi3)
    (list 'nodo key hi1 hi2 hi3)))

;;Procedimentos observadores

;;Predicados
(define hoja?
  (lambda (exp)
    (eqv? (car exp) 'hoja)))

(define nodo?
  (lambda (exp)
    (eqv? (car exp) 'nodo)))

;;Extractores
(define hoja->valor
  (lambda (exp)
    (cadr exp)))

(define nodo->key
  (lambda (exp)
    (cadr exp)))

(define nodo->hij1
  (lambda (exp)
    (caddr exp)))

(define nodo->hij2
  (lambda (exp)
    (cadddr exp)))

(define nodo->hij3
  (lambda (exp)
    (car (cddddr exp))))

;;;Area del programador
;;;Ejemplos
(define suma
  (lambda (arb)
    (cond
      [(hoja? arb) (hoja->valor arb)]
      [(nodo? arb) (+ (suma (nodo->hij1 arb))
                        (suma (nodo->hij2 arb))
                        (suma (nodo->hij3 arb)))]
      [else (eopl:error "Esto no es un árbol")]
      )))

(define arbol1
  (nodo 'k
        (nodo 'p (hoja 3) (hoja 5) (hoja 7))
        (nodo 'l (hoja 8) (hoja 6) (hoja 11))
        (hoja 12)
        ))