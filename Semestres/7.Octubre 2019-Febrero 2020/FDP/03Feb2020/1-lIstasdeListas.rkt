;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 1-lIstasdeListas) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;;Autor: Carlos A Delgado
;;Fecha: 02 de Feb de 2020
;;Contrato: sumar-listas: lista de lista de números -> numero
;;Propósito: Permite sumar los elementos de una lista de lista de números
;;Ejemplos
;;(sumar-listas (list (list 1 2 3) 3 (list 2 3 5) 8)) 27
;;(sumar-listas (list 1 2 (list (list 2 3 4) 3)) (list 2 3) 5)) 25
(define (sumar-lista lln)
  (cond
    [(empty? lln) 0]
    [(cons? (first lln)) (+ (sumar-lista (first lln)) (sumar-lista (rest lln)))]
    [else (+ (first lln) (sumar-lista (rest lln)))]
    )
  )
(check-expect (sumar-lista (list (list 1 2 3) 3 (list 2 3 5) 8)) 27)
;(check-expect (sumar-lista (list 1 2 (list (list 2 3 4) 3) (list 2 3) 5)) 25)
