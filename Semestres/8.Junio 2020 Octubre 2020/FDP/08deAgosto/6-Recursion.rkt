;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6-Recursion) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;;Recursión

;;Autor: Carlos A Delgado S
;;Fecha: 08 de Agosto de 2020
;;Contrato: factorial: numero -> numero
;;Propósito: Calcular n!
;;(fact 5) 120
;;(fact 8) 40320
(define (fact n)
  (cond
    [(not (number? n)) (error "La entrada debe ser un número")]
    [(= n 0) 1] ;;Caso base o trivial
    [else (* n (fact (- n 1)))] ;;Caso recursivo
    ))

(check-expect (fact 5) 120)
(check-expect (fact 8) 40320)