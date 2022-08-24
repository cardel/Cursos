#lang eopl
#|
<registro> ::= <llave> <valor>
                  ::= <llave> <valor> <registro>

<llave> ::= <identificador>
<valor> ::= <identificador> | <numero>
|#

(define sumar_numeros_registro
  (lambda (reg)
    (cond
      [(= (length reg) 2)
       (if (number? (cadr reg)) (cadr reg) 0)]
      [else
       (+
        (if (number? (cadr reg)) (cadr reg) 0)
        (sumar_numeros_registro (caddr reg)))])))

(define reg1 '( x 2))
(define reg2 '(x x))
(define reg3 '( x 3 (y 4 (z 3 (p z (k 2))))))

(define registro->keys
  (lambda (reg)
    (cond
      [(= (length reg) 2) (list (car reg))]
      [else
       (cons (car reg)
             (registro->keys (caddr reg)))])))