;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 5-AbstraccionFuncional1) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;Autor: Carlos A Delgado
;Fecha: 05 de Septiembre de 2020
;COntrato: operar: numero,numero,(numero,numero->numero) -> numero
;Descripción: esta función permite realizar una operación entre dos números
;Ejemplos (operar 1 2 +) -> 3
; (operar 4 5 *) -> 20
(define (operar x y f)
  (f x y))

(check-expect (operar 1 2 +) 3)
(check-expect (operar 4 5 *) 20)