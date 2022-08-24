;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |1. AbstraccionI|) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
;;Autor: Carlos A Delgado
;;Fecha: 22 de Marzo de 2021
;;Contrato: operar: numero,numero, (numero,numero->numero) -> numero
(define (operar a b f)
  (f a b))


(operar 1 2 +)
(operar 1 3 *)
(operar 1 4 /)
(operar 2 8 -)
(operar 5 4 expt)

;;a*a+b*b
(define (g x y)
  (+ (sqr x) (sqr y)))

(operar 5 4 g)