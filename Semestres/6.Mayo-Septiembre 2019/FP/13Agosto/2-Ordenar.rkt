;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 2-Ordenar) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require racket/base)
;;Contrato sort: lista de numeros -> lista de numeros
;;Propósito: Esta función recibe una lista que está en cualquier orden y retorna la lista con los elementos ordenados
;
(define (ordenar lst)
  (cond
    [(empty? lst) empty]
    [else  (insert (first lst) (ordenar (rest lst)))]
    )
  )
(define (insert n lst)
  (cond
    [(empty? lst) (cons n empty)]
    [(> (first lst) n) (cons n lst)]
    [else (cons (first lst) (insert n (rest lst)))]
    )
  )


(ordenar (list 4 5 1 2 3 0))

