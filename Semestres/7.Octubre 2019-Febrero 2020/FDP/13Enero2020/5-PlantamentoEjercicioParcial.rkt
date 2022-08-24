;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 5-PlantamentoEjercicioParcial) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
(define-struct inventario (el1 el2 el3))

(define-struct electro (nombre consumo horas))

(define invA (make-inventario
              (make-electro 'nevera 100 10)
              (make-electro 'tv 200 30)
              (make-electro 'pc 70 120)))

;;Total son 15400 Kw

;; 300 * 50 + 200*100 + 500 * 150 + 14400*200
;;Se pagan 2990000

(define invB
  (make-inventario
   (make-electro 'celular 30 8)
   (make-electro 'tostadora 40 2)
   (make-electro 'ventilador 10 3)))

;; 30*8 + 40*2 +10*3
;;Se gastan 350 Kw en un mes

;;300*50 + 50*100
;;Pagan 20000

(define invC
  (make-inventario
   (make-electro 'licuadora 10 17)
   (make-electro 'radio 20 20)
   (make-electro 'aireAcondicionado 40 10)))

;;170 + 400 +400 = 970

;;300*50 + 200*100 + 470*150 
;;105500

;;Autor: Carlos A Delgado
;;Fecha: 13 de Enero de 2020
;;Contrato: calcular-costo: inventario -> numero
;;Descripción: Calcular el costo de la energía de una casa que tiene 3 electrodomesticos
;;Ejemplos