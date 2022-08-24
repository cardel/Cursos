#lang eopl

;;Representación basada en procedimientos
;;Gramatica
;; <arbol-b> ::= (arbol-bhoja) <int>
;;           ::= (arbol-bnodo) <simbolo> <arbol-b> <arbol-b>
;; 
(define arbol-bhoja
  (lambda (val)
    (lambda (signal sym)
      (cond
        [(= 1 signal) val] ;;Suma
        [(= 2 signal) #F]  ;;Buscar
        [else (eopl:error "error")]
      ))))

(define arbol-bnodo
  (lambda (sym hiz hid)
    (lambda (signal symIn)
      (cond
        [(= signal 1) (+ (sumar hiz) (sumar hid))]
        [(= signal 2) (or
                       (equal? sym symIn)
                       (buscar-simbolo hiz sym)
                       (buscar-simbolo hid sym)
                       )
                      ]
        )
      )
    )
  )

(define sumar
  (lambda (arb)
    (arb 1 'p)))

(define buscar-simbolo
  (lambda (arb sym)
    (arb 2 sym)))

;;Extensión


;;Area del programador

(define arbolitoNavidad
      (arbol-bnodo 'x
           (arbol-bnodo 'y 
                   (arbol-bhoja 2)
                   (arbol-bhoja 3)
            )
           (arbol-bhoja 4)
))
