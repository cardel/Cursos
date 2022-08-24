
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
    (lambda (s)
      (cond
        [(= s 0) 'tree-empty]
        [else (eopl:error "Señal erronea")]))))

(define tree-number
  (lambda (n)
    (lambda (s)
      (cond
        [(= s 0)'tree-number]
        [(= s 1) n]
        [else (eopl:error "Señal errónea")]))))

(define tree-b-number
  (lambda (n l r)
    (lambda (s)
      (cond
        [(= s 0) 'tree-b-number]
        [(= s 1) n]
        [(= s 2) l]
        [(= s 3) r]
        [else (eopl:error "Señal erronea")]))))

(define tree-b-symbol
  (lambda (s l r)
    (lambda (s)
      (cond
        [(= s 0) 'tree-b-symbol]
        [(= s 1) s]
        [(= s 2) l]
        [(= s 3) r]
        [else (eopl:error "Señal erronea")]))))


;;Observadores

;;Predicados
(define tree-empty?
  (lambda (arb)
    (eqv? 'tree-empty (arb 0))))

(define tree-number?
  (lambda (arb)
    (eqv? 'tree-number (arb 0))))

(define tree-b-number?
  (lambda (arb)
    (eqv? 'tree-b-number (arb 0))))

(define tree-b-symbol?
  (lambda (arb)
    (eqv? 'tree-b-symbol (arb 0))))

;;Demostración
(define tree-number->number
  (lambda (arb)
    (arb 1)))

(define tree-b-number->number
  (lambda (arb)
    (arb 1)))

(define tree-b-number->left
  (lambda (arb)
    (arb 2)))

(define tree-b-number->right
  (lambda (arb)
    (arb 3)))


(define tree-b-symbol->symbol
  (lambda (arb)
    (arb 1)))

(define tree-b-symbol->left
  (lambda (arb)
    (arb 2)))

(define tree-b-symbol->right
  (lambda (arb)
    (arb 3)))

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