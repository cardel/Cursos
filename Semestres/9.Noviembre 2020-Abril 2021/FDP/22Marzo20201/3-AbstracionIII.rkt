;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 3-AbstracionIII) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
;;Autor: Carlos A Delgado
;;Fecha: 22 de Marzo de 2021
;;Contrato: comparar-5: numero, (numero->booleano) -> booleano
(define (comparar-5 num f)
  (f num))



;;Auxiliares
(define (mayor-5 num)
  (> num 5))

(define (menor-5 num)
  (< num 5))

(define (mayor-igual-5 num)
  (>= num 5))


(comparar-5 10 mayor-5)
(comparar-5 15 menor-5)
(comparar-5 5 mayor-igual-5)