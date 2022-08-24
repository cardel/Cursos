#lang eopl
#|
Autor: Carlos A Delgado
Fecha: 02 de Abril
Descripcion: Código de ejemplo datatypes de arbol
<arbol-b> ::= <empty>
          ::= <int>
          ::= <int> <arbol-b> <arbol-b>
          ::= <symbol> <arbol-b> <arbol-b>

(arbol-empty)
(arbol-leaf num)
(arbol-int num left right)
(arbol-symbol sym left right>
|#

(define-datatype arbol-b arbol-b?
  (arbol-empty)
  (arbol-leaf (num number?))
  (arbol-int (num number?)
             (left arbol-b?)
             (right arbol-b?))
  (arbol-symbol (sym symbol?)
                (left arbol-b?)
                (right arbol-b?)))

(define sumar-arbol
  (lambda (arb)
    (cases arbol-b arb
      (arbol-empty () 0)
      (arbol-leaf (n) n)
      (arbol-int (n l r)
                 (+
                  n
                  (sumar-arbol l)
                  (sumar-arbol r)))
      (arbol-symbol (s l r)
                    (+
                     (sumar-arbol l)
                     (sumar-arbol r)))
      )))

(define arbol-igual
  (lambda (arb1 arb2)
    (cases arbol-b arb1
      (arbol-empty () (cases arbol-b arb2
                        (arbol-empty () #T)
                        (else #F)))
      (arbol-leaf (n) (cases arbol-b arb2
                        (arbol-leaf (m) (= m n))
                        (else #F)))
      (arbol-int (n l r)
                 (cases arbol-b arb2
                   (arbol-int (m l2 r2)
                              (and
                               (= m n)
                               (arbol-igual l l2)
                               (arbol-igual r r2)))
                   (else #F)))

      
      (arbol-symbol (n l r)
                    (cases arbol-b arb2
                      (arbol-symbol (m l2 r2)
                                    (and
                                     (eqv? m n)
                                     (arbol-igual l l2)
                                     (arbol-igual r r2)))
                      (else #F))))))


(define arbol1 (arbol-int 1 (arbol-empty) (arbol-leaf 4)))
(define arbol2 (arbol-int 1 (arbol-empty) (arbol-leaf 4)))
(define arbol3 (arbol-int 1 (arbol-empty) (arbol-leaf 8)))

(display (arbol-igual arbol1 arbol2))
(display "\n")
(display (arbol-igual arbol1 arbol3))


(define recorrido-inorden
  (lambda (arb)
    (cases arbol-b arb
      (arbol-empty () '())
      (arbol-leaf (n) (list n))
      (arbol-int (n l r)
                 (append
                  (recorrido-inorden l)
                  (list n)
                  (recorrido-inorden r)))
      (arbol-symbol (n l r)
                    (append
                     (recorrido-inorden l)
                     (list n)
                     (recorrido-inorden r))))))



    




