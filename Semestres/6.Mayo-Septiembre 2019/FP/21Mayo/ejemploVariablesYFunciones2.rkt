;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ejemploVariablesYFunciones2) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;;Autor: Carlos A Delgado, Codigo XXX
;;Fecha: 28 de Mayo de 2019
;;COntrato: calcular-area: numero -> numero
;;Propósito: Calcular el area de circulo dado el radio
;;Ejemplo (calcular-area 3) -> 9*3.1416 = 28.2744
;;        (calcular-area 5) -> 5*3.1416 = 15.708

(define (calcular-area radio)
  (* (sqr radio) pi)
  )

(calcular-area 3)
(calcular-area 5)