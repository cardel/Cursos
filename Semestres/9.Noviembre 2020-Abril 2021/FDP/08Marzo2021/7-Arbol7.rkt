;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 7-Arbol7) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
;;Autor: Carlos A Delgado
;;Fecha 08 de Marzo de 2020
;;Contrato: insert: numero, listade numeros -> lista de números
;;Esta función recibe un número y una lista ordenada, retornando una lista de números ordenada

(define (insert num lst)
  (cond
    [(empty? lst) (cons num empty)]
    [(> (first lst) num)  (cons num lst)]
    [else
     (cons (first lst) (insert num (rest lst)))
     ]
    ))

;(insert 4 (cons 1 (cons 2 (cons 8 (cons 10 empty)))))



(define (ordenar lst)
  (cond
    [(empty? lst) empty]
    [else
     (insert (first lst) (ordenar (rest lst)))
     ])
  )

(ordenar (cons 1 (cons 4 (cons 0 (cons 6 (cons 9 (cons 3 empty)))))))