;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Funciones2) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))
;; Autor: Carlos A Delgado
;; Fecha: 28 de Octubre de 2019
;; Contrato: area: numero -> numero
;; Propósito: Toma el valor del lado de un cuadrado y retorna el area
;; Ejemplos (area 5) = 25
;;   (area 10) = 100
(define (area lado)
  (sqr lado))
;;Pruebas
(check-expect (area 5) 25)
(check-expect (area 10) 100)
(check-expect (area 12) 144)


;;Autor: Carlos A Delgado
;;Fecha: 28 de Octubre de 2019
;;Contrato: areaC: numero -> numero
;;Proposito: Dado el radio de un circulo, calcular su area
;;Ejemplos
;; (areaC 8) 64pi
;; (areaC 10) 100pi
(define (areaC radio)
  (* pi (sqr radio)))
;;Pruebas
(areaC 8)
(areaC 10)