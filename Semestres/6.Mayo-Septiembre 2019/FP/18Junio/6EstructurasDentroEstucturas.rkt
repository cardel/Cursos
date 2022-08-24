;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6EstructurasDentroEstucturas) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;;Carro: Sillas, motor, puertas, llantas
;; Sillas. material, color
;; Motor: marca, cilindraje, potencia
;; Puertas: color, material
;; Llantas: marca, tamanio, material
(define-struct carro (sillas motor puertas llantas))

(define-struct sillas (material color))
(define-struct motor (marca cilindraje potencia))
(define-struct puertas (color material))
(define-struct llantas (marca tamanio material))

(define carroA
  (make-carro
   (make-sillas "cuero" "negro")
   (make-motor "Kumis" 100 100)
   (make-puertas "Roja" "Madera")
   (make-llantas "Micheline" "Grandes" "Icopor")))
