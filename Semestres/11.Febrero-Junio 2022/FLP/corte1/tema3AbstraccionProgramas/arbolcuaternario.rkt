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
             (suma-enteros-arbol (cadr arb))
             (suma-enteros-arbol (caddr arb))
             (suma-enteros-arbol (cadddr arb))
             (suma-enteros-arbol (car (cddddr arb)))
        )])))


(define arb1 '())
(define arb2 3)
(define arb3 'x)
(define arb4 '(3 2 3 4 5))
(define arb5 '(3 (3 x y 2 3) (3 3 z w 3) () ()))
(define arb6 '(4 () () ()()))


(define buscar-simbolo
  (lambda (arb sym)
    (cond
      [(null? arb) #F]
      [(symbol? arb) (eqv? arb sym)]
      [(number? arb) #F]
      [else (or
             (buscar-simbolo (cadr arb) sym)
             (buscar-simbolo (caddr arb) sym)
             (buscar-simbolo (cadddr arb) sym)
             (buscar-simbolo (car (cddddr arb)) sym)
        )])))