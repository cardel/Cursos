;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2-Estructuras) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;;Ejemplo de estructuras

(define-struct vehiculo (marca color costo))

(define vehiculoA (make-vehiculo 'Hyundai 'Rojo 20000000))

(vehiculo? 5)
(vehiculo? vehiculoA)

(vehiculo-marca vehiculoA)
(vehiculo-color vehiculoA)
(vehiculo-costo vehiculoA)