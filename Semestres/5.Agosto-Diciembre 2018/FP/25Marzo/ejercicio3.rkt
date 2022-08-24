;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ejercicio3) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "guess.rkt" "teachpack" "htdp")) #f)))
;;filtro: lista-numeros, (numero->booleano) -> lista-numeros

(define (filtro l pred)
  (cond
    [(empty? l) empty]
    [(pred (first l))
     (cons (first l) (filtro (rest l) pred))]
    [else
     (filtro (rest l) pred)]))


(define (mayor-que-2 x) (> x 2))
(filtro (list 1 2 3 4 5) odd?)
(filtro (list 1 2 3 4 5) even?)
(filtro (list 1 2 3 4 5) mayor-que-2)