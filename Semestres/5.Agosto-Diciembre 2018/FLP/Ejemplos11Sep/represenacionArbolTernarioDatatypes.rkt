#lang eopl

(define-datatype arbol-ternario arbol-ternario?
  (hoja (dato number?))
  (nodo (key symbol?)
        (hi1 arbol-ternario?)
        (hi2 arbol-ternario?)
        (hi3 arbol-ternario?)))

(define suma
  (lambda (arbol)
    (cases arbol-ternario arbol
        (hoja (dato) dato)
        (nodo (key h1 h2 h3)
              (+
               (suma h1)
               (suma h2)
               (suma h3)))
      )
    )
  )

(define arbol1
  (nodo 'k
        (nodo 'p (hoja 3) (hoja 5) (hoja 7))
        (nodo 'l (hoja 8) (hoja 6) (hoja 11))
        (hoja 12)
        ))
      
