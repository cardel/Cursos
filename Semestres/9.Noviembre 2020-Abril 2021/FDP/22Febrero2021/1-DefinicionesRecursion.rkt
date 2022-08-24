;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 1-DefinicionesRecursion) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
;;Autor: Carlos A Delgado
;;Fecha: 22 de Feb de 2021
;;Contrato: factorial: numero -> numero
;;Propósito: ilustrar la recursión
;;Ejemplos
;;5! = 5*4*3*2*1*1 = 120
;;6! = 720
;;2! = 2
(define (factorial n)
  (cond
    [(= n 0) 1]
    [else (* n (factorial (- n 1)))]
    ))

(check-expect (factorial 5) 120)
(check-expect (factorial 6) 720)
(check-expect (factorial 2) 2)


;;Autor: Carlos A Delgado
;;Fecha: 22 de Feb de 2021
;;Contrato: multiplicacion: numero, numero -> numero
;;Propósito: Ilustrar la recursión de la multiplicación
;;Ejemplo
;;a = 2 b = 5  10
;;a = 8 b = 0  0
;;a = 100 b = 10 1000
(define (multiplicacion a b)
  (cond
    [(= b 0) 0]
    [else (+ a (multiplicacion a (- b 1)))]
    ))

(check-expect (multiplicacion 2 5) 10)
(check-expect (multiplicacion 8 0) 0)
(check-expect (multiplicacion 100 10) 1000)

;;Autor: Carlos A Delgado
;;Fecha: 22 de Feb de 2021
;;Contrato: elevar: numero, numero -> numero
;;Propósito: Ilustrar la potenciación como regla recursiva
;;Ejemplos
;;a = 2 b = 3  8
;;a = 3 b = 2  9
;;a = 4 b = 3  64
(define (elevar a b)
  (cond
    [(= b 0) 1]
    [else (multiplicacion a (elevar a (- b 1)))]
    ))

(check-expect (elevar 2 3) 8)
(check-expect (elevar 3 2) 9)
(check-expect (elevar 4 3) 64)