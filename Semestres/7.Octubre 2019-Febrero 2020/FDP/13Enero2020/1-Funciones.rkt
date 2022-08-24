;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 1-Funciones) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;;Peoblema de la discoteca.

;;Autor: Carlos A Delgado
;;Fecha: 13 de Enero de 2020
;;Contrato: discoteca_clubbar: numero -> cadena de texto
;;Propósito: Esta función me permite tomar una decisión de la entrada
;;a una discoteca de acuerdo a la edad, se tienen 5 casos
;;Ejemplos:
;;(discoteca_clubbar 12) -> "No puede entrar"
;;(discoteca_clubbar 13) -> "Chiquiteca"
;;(discoteca_clubbar 15) -> "Galpón"
;;(discoteca_clubbar 17.5) -> "Curvas"
;;(discoteca_clubbar 19) -> "Ingresar"
(define (discoteca_clubbar edad)
  (cond
    [(and (>= edad 0) (<= edad 12)) "No puede entrar"]
    [(and (> edad 12) (<= edad 14)) "Chiquiteca"]
    [(and (> edad 14) (<= edad 17)) "Galpón"]
    [(and (> edad 17) (< edad 18)) "Curvas"]
    [(>= edad 18) "Puede entrar"]
    [else (error "La edad debe ser mayor o igual que 0")]
    ))

;;Pruebas
(check-expect (discoteca_clubbar 12) "No puede entrar")
(check-expect (discoteca_clubbar 13) "Chiquiteca")
(check-expect (discoteca_clubbar 15) "Galpón")
(check-expect (discoteca_clubbar 17.5) "Curvas")
(check-expect (discoteca_clubbar 19) "Puede entrar")