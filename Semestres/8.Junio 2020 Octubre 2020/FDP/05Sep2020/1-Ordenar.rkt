;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 1-Ordenar) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;;Autor: Carlos A Delgado
;;Fecha: 5 de Septiembre de 2020
;;Contrato: ordenar: lista de numeros -> lista de numeros
;;Propósito: Ordenar de menor a mayor un alista de números
;;Ejemplos
;;(9 8 1 2 0) -> (0 1 2 8 9)
;;(-4 5 0 2 3) -> (-4 0 2 3 5)
(define (ordenar lstnum)
  (cond
    [(empty? lstnum) empty]
    [else (ordenarAux (first lstnum) 
            (ordenar (rest lstnum)) )]
    ))

(check-expect (ordenar (list 9 8 1 2 0)) (list 0 1 2 8 9))

;;Contrato: OrdenarAux: numero, lista de numeros -> lista de numeros
(define (ordenarAux num lstOrdenada)
  (cond
    [(empty? lstOrdenada) (cons num empty)]
    [(< num (first lstOrdenada)) (cons num lstOrdenada)]
    [else (cons (first lstOrdenada) (ordenarAux num (rest lstOrdenada)))]
    ))

;;(ordenarAux 5 (cons 1 (cons 4 (cons 6 (cons 7 empty)))))