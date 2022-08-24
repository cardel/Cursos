;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname 5-Vectores) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))
(define vectorA (make-vector 10))

(vector-set! vectorA 0 5)
(vector-set! vectorA 9 10)

vectorA

(vector-ref vectorA 4)

(define vectorB (list->vector (list 4 5 6 98 8 01 10 "hola" (make-posn 2 3) 2 'hola)))


(vector-set! vectorB 3 "hola wey")