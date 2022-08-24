;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 5EstructurasDentroEstructuras) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;;Ejercicio estructuras dentro de estructuras

(define-struct habitacion (cam est lam))

(define-struct cama (largo ancho))
(define-struct estanteria (nombre descripcion))
(define-struct lampara (color marca))

(define camaA (make-cama 9 10))
(define estA (make-estanteria "Bifet" "Bifet caro de la abuela"))
(define lampA (make-lampara "Azul" "Asus"))
(define habA (make-habitacion camaA estA lampA))