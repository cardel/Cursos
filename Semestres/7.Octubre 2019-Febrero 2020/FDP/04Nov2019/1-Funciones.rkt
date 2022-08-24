;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 1-Funciones) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))
;;Autor: Carlos A Delgado
;;Fecha: 04 de Nov de 2019
;;Contrato: hipotenusa: numero, numero -> numero
;;Propósito: Calcular la hipotenusa de un triangulo dado el valor de sus catetos
;;EJemplo (hipotenusa 4 3) -> 5, (hipotenusa 6 8) -> 10
(define (hipotenusa cateto1 cateto2)
  (sqrt (+ (sqr cateto1) (sqr cateto2))))

(check-expect (hipotenusa 4 3) 5)
(check-expect (hipotenusa 6 8) 10)

;;Autor: Carlos A Delgado
;;Fecha: 4 - Nov - 2019
;;Contrato: area:num->num
;Descripción: Esta función calcula el area de un circulo usando el diámetro
;;Ejemplos (area 6) ->9*pi ;;                (area 8) -> 16*pi
(define (area diam)
  (* 3.14 (sqr (/ diam 2))))

(check-expect (area 6) 28.26)
(check-expect (area 8) 50.24)