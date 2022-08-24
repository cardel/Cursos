;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2-JuegoBob) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp")) #f)))
;Autor: Juan Felipe Arango
;Fecha: 25-07-2020
;Contrato: chequear-diferencia: numero,numero -> simbolo
;Descripción, si la diferencia entre los números es 0, 'iguales
;Si la diferencia entre los numeros es menor que 500, 'menor-que-500
;Si la diferencia entre los números es mayor o igual que 500, 'mayor-o-igual-500
;Ejemplos
;(chequear-diferencia 400 400) 'iguales
;(chequear-diferencia 200 300) 'menor-que-500
;(chequear-diferencia 300 200) 'menor-que-500
;(chequear-diferencia 100 600) 'mayor-o-igual-500
(define (chequear-diferencia x y)
  (cond
    [(= x y) 'iguales]
    [ (< (abs (- x y)) 5) 'menor-5]
    [(and (>= (abs (- x y)) 5) (< (abs (- x y)) 10))  'menor-que-10]
    [(and (>= (abs (- x y)) 10) (< (abs (- x y)) 25))  'menor-que-25]
    [(and (>= (abs (- x y)) 25) (< (abs (- x y)) 50))  'menor-que-50]
    [(and (>= (abs (- x y)) 50) (< (abs (- x y)) 75))  'menor-que-75]
    [(and (>= (abs (- x y)) 75) (< (abs (- x y)) 125))  'menor-que-125]
    [(and (>= (abs (- x y)) 125) (< (abs (- x y)) 250))  'menor-que-250]
    [(and (>= (abs (- x y)) 250) (< (abs (- x y)) 500))  'menor-que-500]
    [(and (>= (abs (- x y)) 500) (< (abs (- x y)) 1000))  'menor-que-1000]
    [(and (>= (abs (- x y)) 1000) (< (abs (- x y)) 1500)) 'menor-que-1500]
    [(and (>= (abs (- x y)) 1500) (< (abs (- x y)) 2000)) 'menor-que-2000]
    [(and (>= (abs (- x y)) 2000) (< (abs (- x y)) 2500)) 'menor-que-2500]
    [(and (>= (abs (- x y)) 2500) (< (abs (- x y)) 3000)) 'menor-que-3000]
    [(and (>= (abs (- x y)) 3000) (< (abs (- x y)) 3500)) 'menor-que-3500]
    [(and (>= (abs (- x y)) 3500) (< (abs (- x y)) 4000)) 'menor-que-4000]
    [(and (>= (abs (- x y)) 4000) (< (abs (- x y)) 4500)) 'menor-que-4500]
    [(and (>= (abs (- x y)) 4500) (< (abs (- x y)) 5000)) 'menor-que-5000]
    [(and (>= (abs (- x y)) 5000) (< (abs (- x y)) 5500)) 'menor-que-5500]
    [(and (>= (abs (- x y)) 5500) (< (abs (- x y)) 6000)) 'menor-que-6000]
    [(and (>= (abs (- x y)) 6000) (< (abs (- x y)) 6500)) 'menor-que-6500]
    [(and (>= (abs (- x y)) 6500) (< (abs (- x y)) 7000)) 'menor-que-7000]
    [(and (>= (abs (- x y)) 7000) (< (abs (- x y)) 7500)) 'menor-que-7500]
    [(and (>= (abs (- x y)) 7500) (< (abs (- x y)) 8000)) 'menor-que-8000]
    [(and (>= (abs (- x y)) 8000) (< (abs (- x y)) 8500)) 'menor-que-8500]
    [(and (>= (abs (- x y)) 8500) (< (abs (- x y)) 9000)) 'menor-que-9000]
    [(and (>= (abs (- x y)) 9000) (< (abs (- x y)) 9500)) 'menor-que-9500]
    [(and (>= (abs (- x y)) 9500) (< (abs (- x y)) 10000)) 'menor-que-10000]
    [(and (>= (abs (- x y)) 10000) (< (abs (- x y)) 10500)) 'menor-que-10500]
    ;5000 en 5000
    [(and (>= (abs (- x y)) 15000) (< (abs (- x y)) 20000)) 'menor-que-20000]
    [(and (>= (abs (- x y)) 20000) (< (abs (- x y)) 25000)) 'menor-que-25000]
    [(and (>= (abs (- x y)) 25000) (< (abs (- x y)) 30000)) 'menor-que-30000]
    [(and (>= (abs (- x y)) 30000) (< (abs (- x y)) 35000)) 'menor-que-35000]
    [(and (>= (abs (- x y)) 35000) (< (abs (- x y)) 40000)) 'menor-que-40000]
    [(and (>= (abs (- x y)) 40000) (< (abs (- x y)) 45000)) 'menor-que-45000]
    [(and (>= (abs (- x y)) 45000) (< (abs (- x y)) 50000)) 'menor-que-50000]
    [(and (>= (abs (- x y)) 50000) (< (abs (- x y)) 55000)) 'menor-que-55000]
    [(and (>= (abs (- x y)) 55000) (< (abs (- x y)) 60000)) 'menor-que-60000]
    [(and (>= (abs (- x y)) 60000) (< (abs (- x y)) 65000)) 'menor-que-65000]
    [(and (>= (abs (- x y)) 65000) (< (abs (- x y)) 70000)) 'menor-que-70000]
    [(and (>= (abs (- x y)) 70000) (< (abs (- x y)) 75000)) 'menor-que-75000]
    [(and (>= (abs (- x y)) 75000) (< (abs (- x y)) 80000)) 'menor-que-80000]
    [(and (>= (abs (- x y)) 80000) (< (abs (- x y)) 85000)) 'menor-que-85000]
    [(and (>= (abs (- x y)) 85000) (< (abs (- x y)) 90000)) 'menor-que-90000]
    [(and (>= (abs (- x y)) 90000) (< (abs (- x y)) 95000)) 'menor-que-95000]
    [(and (>= (abs (- x y)) 95000) (< (abs (- x y))100000)) 'menor-que-100000]
    [(and (>= (abs (- x y)) 100000) (< (abs (- x y)) 105000)) 'menor-que-105000]
    
    ))
 
; (check-expect (chequear-diferencia 400 400) 'iguales)
; (check-expect (chequear-diferencia 200 300) 'menor-que-500)
; (check-expect (chequear-diferencia 300 200) 'menor-que-500)
; (check-expect (chequear-diferencia 100 600) 'mayor-o-igual-500)


(guess-with-gui chequear-diferencia)