;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |3 Condicionales I|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;Autor: Carlos A Delgado
;;Fecha: 04 de Julio de 2020
;;COntrato: funcion: numero -> string
;;Propósito: Dar un mensaje de acuerdo al número ingresado
;;EJemplos (funcion 3) "estoy entre 2 y 5"
;;(funcion 5) "estoy entre 2 y 5"
;;(funcion 11) "soy mayor que 10"
;;(funcion -3) "soy menor que 2"
;;(funcion 8) "soy mayor que 5 y menor o igual que 10"
(define (funcion a)
  (cond
    [(< a 2) "soy menor que 2"]
    [(and (>= a 2) (<= a 5)) "estoy entre 2 y 5"]
    [(and (> a 5) (<= a 10)) "soy mayor que 5 y menor o igual que 10"]
    [else "soy mayor que 10"]
    ))

(check-expect (funcion 3) "estoy entre 2 y 5")
(check-expect (funcion 5) "estoy entre 2 y 5")
(check-expect (funcion 11) "soy mayor que 10")
(check-expect (funcion -3) "soy menor que 2")
(check-expect (funcion 8) "soy mayor que 5 y menor o igual que 10")