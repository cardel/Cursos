;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 7-Condicionales) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;;Autor: Carlos A Delgado
;;Fecha: 11 de Nov de 2019
;;Contrato: chequear-numeros: numero, numero -> simbolo
;;Proposito: Determinar si la diferencia de dos numeros, es pequeña, grande o son iguales
;;Ejemplos

(define (chequear-numeros a b)
  (cond
    [(= a b) 'hasganadoeljuego]
    [(> (abs (- a b)) 50000) 'mayor50000](guess-with-gui chequear-numeros)
    [(and (> (abs (- a b)) 25000) (<= (abs (- a b)) 50000)) 'mayor25000]
    [(and (> (abs (- a b)) 12500) (<= (abs (- a b)) 25000)) 'mayor12500]
    [(and (> (abs (- a b)) 6250) (<= (abs (- a b)) 12500)) 'mayor6250]
    [(and (> (abs (- a b)) 3125) (<= (abs (- a b)) 6250)) 'mayor3125]
    [(and (> (abs (- a b)) 1500) (<= (abs (- a b)) 3125)) 'mayor1500]
    [(and (> (abs (- a b)) 1000) (<= (abs (- a b)) 1500)) 'mayor1000]
    [(and (> (abs (- a b)) 500) (<= (abs (- a b)) 1000)) 'mayor500]
    [(and (> (abs (- a b)) 250) (<= (abs (- a b)) 500)) 'mayor250]
    [(and (> (abs (- a b)) 125) (<= (abs (- a b)) 250)) 'mayor125]
    [(and (> (abs (- a b)) 50) (<= (abs (- a b)) 125)) 'mayor50]
    [(and (> (abs (- a b)) 20) (<= (abs (- a b)) 50)) 'mayor20]
    [(and (> (abs (- a b)) 10) (<= (abs (- a b)) 20)) 'mayor10]
    [(and (> (abs (- a b)) 5) (<= (ab(guess-with-gui chequear-numeros)s (- a b)) 10)) 'mayor5]
    [else 'menor5]     
    )
  )

(guess-with-gui chequear-numeros)