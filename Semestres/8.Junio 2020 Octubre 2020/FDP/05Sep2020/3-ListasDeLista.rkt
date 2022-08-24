;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 3-ListasDeLista) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;;Autor: Carlos A Delgado
;;Fecha: 04 de Sep de 2020
;;size: lista de lista de simbolos -> numero
;;Propósito: Esta función cuenta el número de simbolos que tiene la lista
;;Ejemplos
;;(cons 'a (cons (cons 'b (cons 'c empty)) (cons 'd (cons 'e (cons (cons 'f (cons 'g empty)) empty)))))
(define (size lst)
  (cond
    [(empty? lst) 0]
    [(cons? (first lst))
     (+ (size (first lst)) (size (rest lst)))]
    [(symbol? (first lst)) (+ 1 (size (rest lst)))]
    [else (error "Los elementos deben ser símbolos")]))

(check-expect (size (cons 'a (cons (cons 'b (cons 'c empty)) (cons 'd (cons 'e (cons (cons 'f (cons 'g empty)) empty)))))
) 7)