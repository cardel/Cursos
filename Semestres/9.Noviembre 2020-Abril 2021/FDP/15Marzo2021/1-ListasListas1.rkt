;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 1-ListasListas1) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
;;Autor: Carlos A Delgado
;;Fecha: 15 de Marzo de 2021
;;Contrato: sumar-lista: lista de lista de números -> número
;;Propósito: Suma los elementos contenidos en una lista de lista de números
;;Ejemplos
;; sumar lista = (cons 1 (cons (cons 2 (cons 3 empty)) (cons (cons 7 (cons 8 (cons 9 empty))) empty))) 30
;; sumar lista = (cons (cons 2 (cons 4 empty)) (cons 7 (cons (cons 9 (cons 10 (cons 11 empty))) (cons 4 empty)))) 47
(define (sumar lst)
  (cond
    [(empty? lst) 0]
    [(cons? (first lst))
     (+
      (sumar (first lst))
      (sumar (rest lst))
      )]
    [else
     (+
      (first lst)
      (sumar (rest lst))
      )]))

(check-expect (sumar  (cons 1 (cons (cons 2 (cons 3 empty)) (cons (cons 7 (cons 8 (cons 9 empty))) empty)))) 30)
(check-expect (sumar (cons (cons 2 (cons 4 empty)) (cons 7 (cons (cons 9 (cons 10 (cons 11 empty))) (cons 4 empty))))) 47)


(define lista
  (cons (cons (cons 1 (cons 2 empty)) (cons 4 empty))
        (cons 2
              (cons (cons 4 (cons (cons 7 (cons 8 empty)) (cons (cons (cons (cons 7 (cons 8 (cons 9 empty))) (cons 7 empty)) (cons 4 empty)) (cons 8 empty)))) empty))))