#lang eopl
#|
<arbol-t> ::= <simbolo>
                 ::= <numero>
                 ::= <simbolo> <arbol-t>
                       <arbol-t> <arbol-t>
                 ::= <numero> <arbol-t>
                       <arbol-t> <arbol-t>
|#
(define arbol-t?
  (lambda (arb)
    (cond
      [(symbol? arb) #T]
      [(number? arb) #T]
      [(and
        (symbol? (car arb))
        (arbol-t? (cadr arb))
        (arbol-t? (caddr arb))
        (arbol-t? (cadddr arb))) #T]
      [(and
        (number? (car arb))
        (arbol-t? (cadr arb))
        (arbol-t? (caddr arb))
        (arbol-t? (cadddr arb))) #T]
      [else #F])))

(arbol-t? 'x)
(arbol-t? 5)
(arbol-t?'(x 4 5 y))
(arbol-t?'(5 (4 5 a p) (5 (4 5 6 7) 2 3) 9))