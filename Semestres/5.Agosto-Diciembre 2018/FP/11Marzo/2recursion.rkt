;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 2recursion) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))

;;Autor: Carlos Delgado
;;Fecha: 11 de Marzo 2019
;;Contrato: sortT: lista-de-numeros -> lista-de-numeros
;;Proposito: Ordenar una lista
;;Pruebas (sortT (list 4 3 2)) -> (list 2 3 4)
(define (sortT l)
  (cond
    [(empty? l) empty]
    [else (aux (sortT (rest l)) (first l))]
    )
  )


;;Condición: l está ordenada
(define (aux l num)
  (cond
    [(empty? l) (list num)]
    [(not (string<? (symbol->string num) (symbol->string (first l)))) (cons num l)]
    [else (cons (first l) (aux (rest l) num))]
    )
  )

;(sortT '(4 5 1 3 2))
(sortT (list 'abc 'dca 'cab 'zab 'wxy))


;;Un estudiante tiene 3 atributos: nombre (simbolo), edad (numero), altura (numero)

;;(menor a mayor) Ordenar por nombre. Otra función para ordenar edad y otra función para ordenar por altura.


;;Ordenar de acuerdo a la edad
(define-struct estudiante (nombre edad altura))

;;Contrato: sort-edad: lista-estudiantes -> lista-estudiantes

(define (sortEdad l)
  (cond
    [(empty? l) empty]
    [else (auxEdad (sortEdad (rest l)) (first l))]
    )
  )


;;Condición: l está ordenada
(define (auxEdad l num)
  (cond
    [(empty? l) (list num)]
    [(< (estudiante-edad num) (estudiante-edad (first l))) (cons num l)]
    [else (cons (first l) (auxEdad (rest l) num))]
    )
  )

(define lista1
  (list (make-estudiante 'Juan 20 178)
  (make-estudiante 'Carlos 35 170)
  (make-estudiante 'Ricardo 25 160))
  )

(sortEdad lista1)

;;Contrato: sortNombre: lista-estudiantes -> lista-estudiantes

(define (sortNombre l)
  (cond
    [(empty? l) empty]
    [else (auxNombre (sortNombre (rest l)) (first l))]
    )
  )


;;Condición: l está ordenada
(define (auxNombre l num)
  (cond
    [(empty? l) (list num)]
    [(string<?
      (symbol->string (estudiante-nombre num))
      (symbol->string (estudiante-nombre (first l)))      )
     (cons num l)]
    [else (cons (first l) (auxNombre (rest l) num))]
    )
  )

(sortNombre lista1)