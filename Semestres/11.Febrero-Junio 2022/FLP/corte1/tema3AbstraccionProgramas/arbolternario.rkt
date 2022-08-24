#lang eopl
#|
<arbol-c> ::= <empty>
                 ::= <int>
                 ::= <symbol>
                 ::= <int> <arbol-c><arbol-c><arbol-c><arbol-c>
|#

(define suma-enteros-arbol
  (lambda (arb)
    (cond
      [(null? arb) 0]
      [(symbol? arb) 0]
      [(number? arb) arb]
      [else (+
             (car arb)
             (sumar-enteros-arbol (cadr arb))
             (sumar-enteros-arbol (caddr arb))
             (sumar-enteros-arbol (cadddr arb))
             (sumar-enteros-arbol (car (cddddr arb)))
        )])))