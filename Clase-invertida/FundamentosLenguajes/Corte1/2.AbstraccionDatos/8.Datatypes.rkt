#lang eopl
#|
<arbol-b> ::= <numero>
             leaf(num)
          ::= <simbolo> <arbol-b> <arbol-b>
             node(key,left,right)
|#
(define-datatype arbol-b arbol-b?
  (leaf (num number?))
  (node (key symbol?)
        (left arbol-b?)
        (right arbol-b?)))

(define arbol1
  (leaf 5))

(define arbol2
  (node 'k (node 'p (leaf 5) (leaf 7))
        (node 'j (leaf 4) (leaf 7))))

(define sumar-arbol
  (lambda (arb)
    (cases arbol-b arb
      (leaf (num) num)
      (node (k l r)
            (+
             (sumar-arbol l)
             (sumar-arbol r))))))

(define arbol-b->listS
  (lambda (arb)
    (cases arbol-b arb
      (leaf (num) '())
      (node (k l r)
            (append
             (list k)
             (arbol-b->listS l)
             (arbol-b->listS r))))))


;;Sintaxis concreta

(define arbol1C '(leaf 5))
(define arbol2C '(node k
                      (node p (leaf 5) (leaf 7))
                      (node j (leaf 4) (leaf 7))))

(define parse
  (lambda (exp)
    (cond
      [(eqv? (car exp) 'leaf)
       (leaf (cadr exp))]
      [else
       (node
        (cadr exp)
        (parse (caddr exp))
        (parse (cadddr exp)))])))

(define unparse
  (lambda (exp)
    (cases arbol-b exp
      (leaf (num) (list 'leaf num))
      (node (k l r)
            (list
             'node
             'k
             (unparse l)
             (unparse r))))))
             
