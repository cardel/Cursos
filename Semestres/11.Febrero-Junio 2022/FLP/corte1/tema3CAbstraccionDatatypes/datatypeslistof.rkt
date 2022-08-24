#lang eopl
#|
Autor: Carlos A Delgado
Fecha: 02 de Abril de 2022

<arbol-n> ::= <empty>
          ::= <num>
          ::= <symbol> <arbol-n>*
|#

(define-datatype arbol-n arbol-n?
  (arbol-n-empty)
  (arbol-n-num (num number?))
  (arbol-n-node (key symbol?)
                (children (list-of arbol-n?))))

(define arbolito1
  (arbol-n-node 'l
                (list
                 (arbol-n-num 2)
                 (arbol-n-num 4)
                 (arbol-n-node 'k
                               (list
                                (arbol-n-num 3)
                                (arbol-n-num 8)
                                (arbol-n-empty))))))



(define suma-num
  (lambda (arb)
    (cases arbol-n arb
      (arbol-n-empty () 0)
      (arbol-n-num (d) d)
      (arbol-n-node (k l)
       (let
           (
            (list-n (map (lambda (x) (suma-num x)) l))
            )
         (letrec
             (
              (sumar-lista (lambda (l)
                             (cond
                               [(null? l) 0]
                               [else (+ (car l) (sumar-lista (cdr l)))])))
              )
           (sumar-lista list-n)))))))

(define arbol-n->list
  (lambda (arb)
    (cases arbol-n arb
      (arbol-n-empty () '())
      (arbol-n-num (d) '())
      (arbol-n-node (k l)
                    (append
                     (list k)
                     (flatten (map (lambda (x) (arbol-n->list x)) l)))))))
                     
                     


(define flatten
  (lambda (l)
    (cond
      [(null? l) '()]
      [(list? (car l)) (append (flatten (car l)) (flatten (cdr l)))]
      [else (cons (car l) (flatten (cdr l)))])))

