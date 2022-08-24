#lang eopl

;;Autor: Carlos A Delgado
;;Fecha: 10 de Junio de 2019

;;Representación unaria

(define zero '())

(define is-zero? null?)

(define succesor
  (lambda (n)
    (cons #t n)))

(define predecesor
  (lambda (n)
    (cdr n)))



;;*********************************
;;Funciones a partir de la representación
;;*********************************

(define plus
  (lambda (x y)
    (cond
      [(is-zero? y) x]
      [else (plus (succesor x) (predecesor y))]
      )
    )
  )