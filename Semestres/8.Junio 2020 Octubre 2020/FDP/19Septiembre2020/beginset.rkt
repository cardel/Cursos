;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname beginset) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define a 5)

;;Funcion que cambia el valor a por (+ a b) donde b es el argumento
;;y nos retorna a + b
;;Autor: Carlos A Delgado
;;Fecha: 19 de Septiembre de 2020
;;Contrato: cambiar-a: numero -> numero
(define (cambiar-a b)
  (begin
    (set! a (+ a b))
    (display a)
    (display "\n")
    (+ a b)))

(cambiar-a 5)
(cambiar-a 8)
(cambiar-a 9)
(cambiar-a 10)
(cambiar-a 5)