#lang eopl

;;Especificación gramatical de un árbol binario
;; <arbol-b> ::= <int> | <simbolo> <arbol-b> <arbol-b>

(define in-S?
  (lambda (arb)
    (cond
      [(number? arb) #T]
      [(symbol? arb) #F]
      [else
       (and
        (symbol? (car arb))
        (in-S? (cadr arb))
        (in-S? (caddr arb)))])))

'( p (s (t 1 2) 4) 3)
