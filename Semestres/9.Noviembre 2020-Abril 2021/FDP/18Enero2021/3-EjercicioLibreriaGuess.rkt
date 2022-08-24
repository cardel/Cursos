;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 3-EjercicioLibreriaGuess) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
;;Autor: Carlos A Delgado
;;Fecha: 18 de Enero de 2020
;;Contrato: chequear-diferencia: numero, numero -> simbolo
;;Propósito: Es indicar mediante un mensaje que tan cerca estamos de un número
;;Si son iguales retorna 'igual
;;Si la diferencia es mayor que 0 y menor o igual a 100 'pequeña
;;Si la diferencia es mayor que 100 y menor o igual a 1000 'mediana
;;Si la diferencia es mayor que 1000 'grande
;;Ejemplos
;;....
(define (chequear-diferencia numA numB)
  (cond
    [(= numA numB) 'igual]
    [(and (> (abs (- numA numB)) 0) (<= (abs (- numA numB)) 5)) 'Cerca5Numeros]
    [(and (> (abs (- numA numB)) 5) (<= (abs (- numA numB)) 25)) 'Cerca20Numeros]
    [(and (> (abs (- numA numB)) 25) (<= (abs (- numA numB)) 100)) 'Cerca75Numeros]
    [(and (> (abs (- numA numB)) 100) (<= (abs (- numA numB)) 200)) 'Cerca100Numeros]
    [(and (> (abs (- numA numB)) 200) (<= (abs (- numA numB)) 350)) 'Cerca150Numeros]
    [(and (> (abs (- numA numB)) 250) (<= (abs (- numA numB)) 450)) 'Cerca200Numeros]
    [(and (> (abs (- numA numB)) 450) (<= (abs (- numA numB)) 1000)) 'Cerca550Numeros]
    [(and (> (abs (- numA numB)) 1000) (<= (abs (- numA numB)) 2500)) 'Cerca1500Numeros]
    [(and (> (abs (- numA numB)) 2500) (<= (abs (- numA numB)) 10000)) 'Cerca7500Numeros]
    [(and (> (abs (- numA numB)) 10000) (<= (abs (- numA numB)) 20000)) 'Cerca10000Numeros]
    [else 'grande]
    ))



(guess-with-gui chequear-diferencia)

    