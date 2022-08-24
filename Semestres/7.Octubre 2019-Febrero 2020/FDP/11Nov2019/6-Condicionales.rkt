;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6-Condicionales) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;;Autor: Carlos A Delgado
;;Fecha: 11 de Nov de 2019
;;Contrato: chequear-numeros: numero, numero -> simbolo
;;Proposito: Determinar si la diferencia de dos numeros, es pequeña, grande o son iguales
;;Ejemplos
;;Diferencia grande > 50000
;;(chequear-numeros 10 20000) 'pequeña
;;(chequear-numeros 10 50011) 'grande
;;(chequear-numeros 1 1) 'iguales

(define (chequear-numeros a b)
  (cond
    [(= a b) 'iguales]
    [(and (> (abs (- a b)) 0) (< (abs (- a b)) 50000)) 'pequeña]
    [else 'grande]
    )
  )

(check-expect (chequear-numeros 10 20000) 'pequeña)
(check-expect (chequear-numeros 10 50011) 'grande)
(check-expect (chequear-numeros 1 1) 'iguales)

(guess-with-gui chequear-numeros)