;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 3-Recursion1) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;;Problema: Consiste en sumar los elementos de una lista

;;(cons 1 (cons 2 (cons 3 (cons 4 empty))))

;;Autor: Carlos A Delgado
;;Fecha: 20 de Enero de 2020
;;COntrato: sumar-lista: lista de numeros -> numero
;;Propósito: Sumar una lista de tamaño arbitrario
;;EJemplos
;;(sumar-lista (cons 1 (cons 2 empty))) -> 3
;;(sumar-lista (cons 2 (cons 4 (cons 6 empty))) -> 12
;;(sumar-lista (cons 1 (cons 3 (cons 5 (cons 7 empty))))) -> 16
(define (sumar-lista lst)
  (cond
    [(empty? lst) 0]
    [else (+ (first lst) (sumar-lista (rest lst)))]
    )
  )

;(sumar-lista (cons 1 (cons 2 empty)))
(sumar-lista (cons 2 (cons 4 (cons 6 empty))))
;(sumar-lista (cons 1 (cons 3 (cons 5 (cons 7 empty)))))
