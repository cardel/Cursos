#lang eopl

;;Gramática del arbol ternario
;; <arbol-ternario> ::= <hoja> numero
;;                  ::= <nodo> simbolo <arbol-ternario> <arbol-ternario> <arbol-ternario>


;;Procedimientos constructores
(define hoja
  (lambda (num)
    (lambda (signal)
      (cond
        [(= signal 1) num]
        [(= signal 2) 'hoja]
        [(= signal 3) num]
        [else (eopl:error "Señal no válida")]
        )
      )
    )
  )

(define nodo
  (lambda (key hi1 hi2 hi3)
    (lambda (signal)
      (cond
        [(= signal 1) (+
                       (suma hi1)
                       (suma hi2)
                       (suma hi3))]
        [(= signal 2) 'nodo]
        [(= signal 3) key]
        [(= signal 4) hi1]
        [(= signal 5) hi2]
        [(= signal 6) hi3]
        [else (eopl:error "Señal no válida")])
      )
  )
)
;;Procedimentos observadores

;;Predicados
(define hoja?
  (lambda (exp)
    (eqv? (exp 2) 'hoja)))

(define nodo?
  (lambda (exp)
    (eqv? (exp 2) 'nodo)))

;;Extractores
(define hoja->valor
  (lambda (exp)
    (exp 3)))

(define nodo->key
  (lambda (exp)
    (exp 3)))

(define nodo->hij1
  (lambda (exp)
    (exp 4)))

(define nodo->hij2
  (lambda (exp)
    (exp 5)))

(define nodo->hij3
  (lambda (exp)
    (exp 6)))

;;;Area del programador
;;;Ejemplos
(define sumaAntigua
  (lambda (arb)
    (cond
      [(hoja? arb) (hoja->valor arb)]
      [(nodo? arb) (+ (suma (nodo->hij1 arb))
                        (suma (nodo->hij2 arb))
                        (suma (nodo->hij3 arb)))]
      [else (eopl:error "Esto no es un árbol")]
      )))

(define suma
  (lambda (arb)
    (arb 1)))

(define arbol1
  (nodo 'k
        (nodo 'p (hoja 3) (hoja 5) (hoja 7))
        (nodo 'l (hoja 8) (hoja 6) (hoja 11))
        (hoja 12)
        ))