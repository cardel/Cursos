;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 1-EjemploListas) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
(define-struct carro (marca modelo precio))

;;Tenemos que seleccionar el carro más barato de una lista de
;;3 carros que se nos da

;;Autor: Carlos A Delgado
;;Fecha: 20 de Enero de 2020
;;Contrato: seleccionar-carro: lista de carro -> carro
;;Propósito: Seleccionar el carro más económico de una lista que se nos da
;;Lista es de tamaño 3
;;Ejemplos
;;(seleccionar carro (cons (make-carro "Mazda" 2018 90) (cons (make-carro "Kia" 2010 50) (cons (make-carro "Chevrolet" 1980 20) empty))))
;;Retorna (make-carro "Chevrolet" 1980 20)
;;Código
(define (seleccionar-carro lcarros)
  (cond
    [(and
      (< (carro-precio (first lcarros)) (carro-precio (first (rest lcarros))))
      (< (carro-precio (first lcarros)) (carro-precio (first (rest (rest lcarros))))))
     (first lcarros)]
    [(< (carro-precio (first (rest lcarros))) (carro-precio (first (rest (rest lcarros)))))
     (first (rest lcarros))]
    [else (first (rest (rest lcarros)))]
    ))

(check-expect (seleccionar-carro (cons (make-carro "Mazda" 2018 90) (cons (make-carro "Kia" 2010 50) (cons (make-carro "Chevrolet" 1980 20) empty)))) (make-carro "Chevrolet" 1980 20))

