;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 4-AbstracionIV) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
;;Filtros

;;Autor: Carlos A Delgado S.
;;Fecha: 22 de Marzo de 2021
;;Contrato: filtro: lista de numeros -> lista de numeros
(define (filtro-par lst)
  (cond
    [(empty? lst) empty]
    [(even? (first lst))  (cons (first lst) (filtro-par (rest lst)))]
    [else (filtro-par (rest lst))]
    ))

(filtro-par (list 1 2 3 4 5 6 7 8))

;;Contrato: filtro: lista de numeros -> lista de numeros
(define (filtro-impar lst)
  (cond
    [(empty? lst) empty]
    [(odd? (first lst))  (cons (first lst) (filtro-impar (rest lst)))]
    [else (filtro-impar (rest lst))]
    ))
(filtro-impar (list 1 2 3 4 5 6 7 8))


;;Contrato: filtro: lista de numeros -> lista de numeros
(define (filtro-mayor-5 lst)
  (cond
    [(empty? lst) empty]
    [(> (first lst) 5)  (cons (first lst) (filtro-mayor-5 (rest lst)))]
    [else (filtro-mayor-5 (rest lst))]
    ))


(filtro-mayor-5 (list 1 2 3 4 5 6 7 8))


;;Contrato: filtro: lista de numeros -> lista de numeros
(define (filtro-mayor-15 lst)
  (cond
    [(empty? lst) empty]
    [(> (first lst) 15)  (cons (first lst) (filtro-mayor-15 (rest lst)))]
    [else (filtro-mayor-15 (rest lst))]
    ))

(filtro-mayor-15 (list 1 2 3 4 5 6 7 8))



;;Autor: Carlos A Delgado S.
;;Fecha: 22 de Marzo de 2021
;;Contrato: filtro: lista de numeros, (numero->booleano) -> lista de numeros
(define (filtro lst f)
  (cond
    [(empty? lst) empty]
    [(f (first lst))  (cons (first lst) (filtro (rest lst) f))]
    [else (filtro (rest lst) f)]
    ))


"Filtro genérico"
(filtro (list 1 2 3 4 5 6 7 8) even?)
(filtro (list 1 2 3 4 5 6 7 8) odd?)

;;contrato: mayor-5: numero->booleano
(define (mayor-5 num)
  (> num 5))

(filtro (list 1 2 3 4 5 6 7 8) mayor-5)


;;contrato: mayor-5-y-par: numero->booleano
(define (mayor-5-y-par num)
  (and (even? num) (> num 5)))


(filtro (list 1 2 3 4 5 6 7 8) mayor-5-y-par)