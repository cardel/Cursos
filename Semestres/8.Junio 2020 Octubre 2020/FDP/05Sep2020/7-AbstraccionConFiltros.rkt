;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 7-AbstraccionConFiltros) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;Autor: Carlos A Delgado
;Contrato: filtro-pares: lista de numeros -> lista de numeros
;Propósito: De una lista vamos a sacar los elementos que son pares
;(filtro-pares (list 1 2 3 4 5) (list 2 4)
;(filtro-pares (list 1 3 5 7) empty
(define (filtro-pares lst)
  (cond
    [(empty? lst) empty]
    [(even? (first lst)) (cons (first lst) (filtro-pares (rest lst)))]
    [else (filtro-pares (rest lst))]
    ))

(check-expect (filtro-pares (list 1 2 3 4 5)) (list 2 4))
(check-expect (filtro-pares (list 1 3 5 7)) empty)

;Autor: Carlos A Delgado
;Contrato: filtro-impares: lista de numeros -> lista de numeros
;Propósito: De una lista vamos a sacar los elementos que son impares
;(filtro-impares (list 1 2 3 4 5)) (list 1 3 5)
;(filtro-impares (list 1 3 5 7)) (list 1 3 5 7)
(define (filtro-impares lst)
  (cond
    [(empty? lst) empty]
    [(odd? (first lst)) (cons (first lst) (filtro-impares (rest lst)))]
    [else (filtro-impares (rest lst))]
    ))

(check-expect (filtro-impares (list 1 2 3 4 5)) (list 1 3 5))
(check-expect (filtro-impares (list 1 3 5 7)) (list 1 3 5 7))

;Contrato: filtro-menor-2: lista de numeros -> lista de numeros
(define (filtro-menor-2 lst)
  (cond
    [(empty? lst) empty]
    [(< (first lst) 2) (cons (first lst) (filtro-menor-2 (rest lst)))]
    [else (filtro-menor-2 (rest lst))]
    ))

(check-expect (filtro-menor-2 (list 1 2 3 4 5)) (list 1))

;;Abstracción funcional

;;filtro: lista de numeros, (numero -> booleano) -> lista de numeros

(define (filtro lst f)
  (cond
    [(empty? lst) empty]
    [(f (first lst)) (cons (first lst) (filtro (rest lst) f))]
    [else (filtro (rest lst) f)]
    ))

;;Funciones auxilares
(define (mayor-que-2 num) (> num 2))
(define (mayor-que-4 num) (> num 4))
(define (menor-que-3 num) (< num 3))

(filtro (list 1 2 3 4 5) even?)
(filtro (list 1 2 3 4 5) odd?)
(filtro (list 1 2 3 4 5) mayor-que-2)
(filtro (list 1 2 3 4 5) menor-que-3)