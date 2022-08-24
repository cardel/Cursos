;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2-Condicionales) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))
;;Autor:Carlos A Delgado
;;Fecha: 11 de Nov de 2019
;;Contrato: f: numero -> numero
;;Propósito: Calcular una función a trozos
;;Ejemplos
;;(f -1) 1  (f -3) 9
;;(f 0) 0  (f 2) 2
;;(f 8) 512 (f 10) 1000
(define (f x)
  (cond
    [(< x 0) (sqr x)]
    [(and (>= x 0) (<= x 5)) x]
    [else (expt x 3)]))

(check-expect (f -1) 1)
(check-expect (f -3) 9)
(check-expect (f 0) 0)
(check-expect (f 2) 2)
(check-expect (f 8) 512)
(check-expect (f 10) 1000)