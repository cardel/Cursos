#lang eopl
#|
<arbol-b> ::= (tree-empty) <empty>
                   ::=(tree-number)  <int>
                   ::=(tree-b-number) <int> <arbol-b> <arbol-b>
                   ::=(tree-b-symbol) <symbol> <arbol-b><arbol-b>
|#
;;Constructor
(define tree-empty
  (lambda ()
    (list 'tree-empty)))

(define tree-number
  (lambda (n)
    (list 'tree-number n)))

(define tree-b-number
  (lambda (n l r)
    (list 'tree-b-number n l r)))

(define tree-b-symbol
  (lambda (s n l)
    (list 'tree-b-symbol s n l)))

;;Observadores

;;Predicados
(define tree-empty?
  (lambda (arb)
    (eqv? 'tree-empty (car arb))))

(define tree-number?
  (lambda (arb)
    (eqv? 'tree-number (car arb))))

(define tree-b-number?
  (lambda (arb)
    (eqv? 'tree-b-number (car arb))))

(define tree-b-symbol?
  (lambda (arb)
    (eqv? 'tree-b-symbol (car arb))))

;;Demostración
(define tree-number->number
  (lambda (arb)
    (cadr arb)))

(define tree-b-number->number
  (lambda (arb)
    (cadr arb)))

(define tree-b-number->left
  (lambda (arb)
    (caddr arb)))

(define tree-b-number->right
  (lambda (arb)
    (cadddr arb)))


(define tree-b-symbol->symbol
  (lambda (arb)
    (cadr arb)))

(define tree-b-symbol->left
  (lambda (arb)
    (caddr arb)))

(define tree-b-symbol->right
  (lambda (arb)
    (cadddr arb)))

;;Area del programador

(define suma-arb
  (lambda (arb)
    (cond
      [(tree-empty? arb) 0]
      [(tree-number? arb) (tree-number->number arb)]
      [(tree-b-number? arb)
       (+
        (tree-b-number->number arb)
        (suma-arb (tree-b-number->left arb))
        (suma-arb (tree-b-number->right arb)))]
      [(tree-b-symbol? arb)
       (+
        (suma-arb (tree-b-symbol->left arb))
        (suma-arb (tree-b-symbol->right arb)))]
      [else (eopl:error "Estructura incorrecta")])))

(define arbol
  (tree-b-number
   5
   (tree-b-symbol 'x (tree-number 3) (tree-number 4))
   (tree-b-number 4 (tree-b-number 2 (tree-number 5) (tree-number 4)) (tree-b-symbol 'x (tree-empty) (tree-number 6)))))


(display (suma-arb arbol))