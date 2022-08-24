#lang eopl

(define arbol-b?
  (lambda (arb)
    (cond
      [(number? arb) #T]
      [(= (length arb) 3) ;Validación por ser Racket
       (and
        (symbol? (car arb))
        (arbol-b? (cadr arb))
        (arbol-b? (caddr arb)))]
      [else #F])))

(display (arbol-b? 1))
(display (arbol-b? '(foo 1 2)))
(display (arbol-b? '(foo 1)))