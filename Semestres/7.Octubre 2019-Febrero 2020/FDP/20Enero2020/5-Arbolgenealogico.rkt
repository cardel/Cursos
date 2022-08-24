;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 5-Arbolgenealogico) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
(define-struct child (mother father name birthyear color-eyes))

;;Primer generación
(define carl (make-child empty empty 'Carl 1970 'morados))
(define maria (make-child empty empty 'Maria 1972 'gris))

;;Segunda generación
(define trinidad (make-child maria carl 'Trinidad 1990 'cafe))
(define paco (make-child maria carl 'Paco 1992 'verde))
(define diego (make-child maria carl 'Diego 1995 'azul))

(define ana (make-child empty empty 'Ana 1995 'cafe))
(define sebastian (make-child empty empty 'Sebastian 2001 'verde))

;;Tercera generación
(define chucho (make-child trinidad empty 'Chucho 2016 'cafe))
(define felipe (make-child ana paco 'Felipe 2010 'verde))
(define juan (make-child ana paco 'Juan 2019 'cafe))
(define carlos (make-child diego sebastian 'Carlos 2021 'verde))
(define andrea (make-child empty empty  'Andrea 2009 'azul))

;;Cuarta generación
(define pablo (make-child andrea felipe 'Pablo 2050 'blancos))