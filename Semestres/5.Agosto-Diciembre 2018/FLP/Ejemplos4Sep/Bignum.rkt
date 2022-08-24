#lang eopl
;;Autor: Carlos Andres Delgado
;;Fecha: 4 Septiembre de 2018
;;Representación Bignum, para números enteros positivos

;;Implementación del tipo de dato Bignum
;;Predicado 0
(define zero?
  (lambda (l)
    (eqv? l '()
         )
    )
  )

;;Operación sucesor
(define succ
  (lambda (l)
    (if (zero? l)
        (cons 1 empty)
        (if (= (car l) 15)
            (cons 0 (succ (cdr l)))
            (cons (+ 1 (car l)) (cdr l))
            )
        )
    )
  )

;;Ejemplos
(succ '(15 8 15))
(succ '(15 15 15))

;;Operación predecesor

(define pred
  (lambda (l)
    (if (and (= 1 (car l)) (eqv? (cdr l) '()))
        '()
        (if (= (car l) 0)
            (cons 15 (pred (cdr l)))
            (cons (- (car l) 1) (cdr l))
            )
        )
    )
  )

(pred '(1))
(pred '(15 15 15))
(pred '(0 1))


;;; Implementación de funciones por parte del programador

;;Suma
(define plus
  (lambda (x y)
    (if (zero? y)
        x
        (succ (plus x (pred y)))
        )
    )
  )

(plus '(1 2) '(15 1))
(plus '(15 1) '(1 2))

;;Resta x - y
(define minus
  (lambda (x y)
    (if (zero? y)
        x
        (pred (minus x (pred y)))
        )
    )
  )

(minus '(0 4) '(15 1))
(minus '(0 4) '(1 2))


;;Potenciación x^y
(define exponent
  (lambda (x y)
    (if (zero? y)
        x
        (plus (exponent x (pred y)) y)
        )
    )
  )

(exponent '(0 4) '(1 2))