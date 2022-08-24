#lang eopl
;;Representación basada en listas
;;Gramatica
;; <arbol-b> ::= (arbol-bhoja) <int>
;;           ::= (arbol-bnodo) <simbolo> <arbol-b> <arbol-b>


(define arbol-bhoja
  (lambda (val) (list 'arbol-bhoja val)))

(define arbol-bnodo
  (lambda (sym hiz hide)
    (list 'arbol-bnodo sym hiz hide)))

(define sumar
  (lambda (arb)
    (cond
      [(equal? 'arbol-bhoja (car arb)) (cadr arb)]
      [else
       (+ (sumar (caddr arb))
          (sumar (cadddr arb)))])))

(define buscar-simbolo
  (lambda (arb sym)
    (cond
      [(equal? 'arbol-bhoja (car arb)) #F]
      [else
       (or
        (eqv? (cadr arb) sym)
        (buscar-simbolo (caddr arb) sym)
          (buscar-simbolo (cadddr arb) sym))])))      

;;Area del programador

(define arbolitoNavidad
      (arbol-bnodo 'x
           (arbol-bnodo 'y 
                   (arbol-bhoja 2)
                   (arbol-bhoja 3)
            )
           (arbol-bhoja 4)
))
