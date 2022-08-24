;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname 9-AbstraccionTipos) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;Autor: Carlos A Delgado
;Fecha: 05 de Septiembre
;;filtro: lista de numeros, (numero, numero -> booleano) -> lista de numeros

(define (filtro lst f dato)
  (cond
    [(empty? lst) empty]
    [else
     (local
       (
        (define resto (filtro (rest lst) f dato))
        (define primero (first lst))
        )
       (cond
         [(f primero dato) (cons primero resto)]
         [else resto]
         )
       )
     ]
    )
  )

(filtro (list 1 2 3 4 5) > 2)
(filtro (list 1 2 3 4 5) < 2)
(filtro (list 1 2 3 4 5) = 2)
(filtro (list 1 2 3 4 5) <= 4)
(filtro (list 1 2 3 4 5) >= 3)