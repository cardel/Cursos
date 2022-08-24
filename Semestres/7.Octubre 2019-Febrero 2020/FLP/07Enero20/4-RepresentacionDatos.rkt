#lang eopl

;;Naturales

;;base es 0
;; n es un número natural, n + 1 número natural


;;Implementación

(define zero 0)

(define is-zero? zero?)

(define succ
  (lambda (n)
    (+ n 1)))

(define pred
  (lambda (n)
    (cond
      [(is-zero? n) (eopl:error "No es posible obtener el predecesor")]
      [else (- n 1)])))


;;; Area deprogramar (interfaz)

(define sumar
  (lambda (a b)
    (cond
      [(is-zero? b) a]
      [(succ (sumar a (pred b)))])))