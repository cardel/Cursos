#lang eopl
<arbol> ::= <number>
            (hoja valor)
            <symbol> <arbol> <arbol>
            (nodo llave hij_izq hij_der

;;Constructores
(define hoja
  (lambda (valor)
    (lambda (signal)
      (cond
        [(= 0 signal) 'hoja]  ;;Predicado
        [(= 1 signal) valor]  ;;Extractor
        [else (eopl:error "Señal no válida")]))))

(define nodo
  (lambda (llave hij_izq hij_der)
    (lambda (signal)
      (cond
        [(= signal 0) 'nodo] ;;Predicado
        [(= signal 1) llave] ;;Extractor llave
        [(= signal 2) hij_izq] ;;Extractor hij_izq
        [(= signal 3) hij_der] ;;Extractor hij_der
        [else (eopl:error "Señal no válida en nodo")]))))

;;Observadores

;;Predicados
(define hoja?
  (lambda (arb)
    (equal? (arb 0) 'hoja)))

(define nodo?
  (lambda (arb)
    (equal? (arb 0) 'nodo)))

;;Extractores

(define hoja->valor
  (lambda (arb)
    (arb 1)))

(define nodo->llave
  (lambda (arb)
    (arb 1)))

(define nodo->hij_izq
  (lambda (arb)
    (arb 2)))

(define nodo->hij_der
  (lambda (arb)
    (arb 3)))

;;Area programación

(define arbol1
  (nodo 'A
        (nodo 'D
              (nodo 'E
                    (hoja 4)
                    (hoja 5))
              (hoja 6))
        (nodo 'B
              (hoja 1)
              (nodo 'C
                    (hoja 2)
                    (hoja 3))))
  )

(define sumar-hojas
  (lambda (arb)
    (cond
      [(hoja? arb) (hoja->valor arb)]
      [(nodo? arb)
       (+
        (sumar-hojas (nodo->hij_izq arb))
        (sumar-hojas (nodo->hij_der arb)))]
      [else (eopl:error "Estructura no válida")])))

(define buscar-simbolo
  (lambda (arb var)
    (cond
      [(hoja? arb) #f]
      [(nodo? arb)
       (if
        (equal? var (nodo->llave arb))
        #t
        (or
         (buscar-simbolo (nodo->hij_izq arb) var)
         (buscar-simbolo (nodo->hij_der arb) var))
        )])))

(display (sumar-hojas arbol1))
(display "\n")
(display (buscar-simbolo arbol1 'D))
(display "\n")
(display (buscar-simbolo arbol1 'J))