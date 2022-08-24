#lang eopl

(define-datatype arbol arbol?
  (vacio)
  (nodo (a number?)
        (hizq arbol?)
        (hder arbol?)
        )
  )

(define arbolA
  (nodo 3 (nodo 5 (vacio) (vacio)) (nodo 8 (nodo 9 (vacio) (vacio)) (vacio))))

(define sumaNodo
  (lambda (arb)
    (cases arbol arb
      (vacio () 0)
      (nodo (valor hiz hde)
            (+ valor
               (sumaNodo hiz)
               (sumaNodo hde)
               )
            )
      )
    )
  )