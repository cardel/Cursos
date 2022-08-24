;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2-EjemploListas) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;;Autor: Carlos A Delgado
;;Fecha 20 de Enero de 2020
;;COntrato: sumar-lista: lista de numeros -> numero
;;Propósito: Sumar una lista que tenga 5 números
;;Ejemplos
;;(sumar-lista (cons 1 (cons 2 (cons 3 (cons 4 (cons 5 empty))))) -> 15
;;(sumar-lista (cons 1 (cons 1 (cons 1 (cons 1 (cons 1 empty))))) -> 5

(define (sumar-lista lnum)
  (+
   (first lnum)
   (first (rest lnum))
   (first (rest (rest lnum)))
   (first (rest (rest (rest lnum))))
   (first (rest (rest (rest (rest lnum)))))))


(check-expect (sumar-lista (cons 1 (cons 2 (cons 3 (cons 4 (cons 5 empty)))))) 15)
(check-expect (sumar-lista (cons 1 (cons 1 (cons 1 (cons 1 (cons 1 empty)))))) 5)
