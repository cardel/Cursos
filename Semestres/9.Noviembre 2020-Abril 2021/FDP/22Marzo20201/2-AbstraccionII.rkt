;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 2-AbstraccionII) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
;;Función que cambie de dolares a yenes, euros o dolares

(define (cambio cnt f)
  (f cnt))


;;Función que cambia de pesos a dolares
(define (pesos->dolares cnt)
  (/ cnt 3650))

;;Funcion que cambia de pesos a euros
(define (pesos->euros cnt)
  (/ cnt 4450))

;;Función que cambia de pesos a yene
(define (pesos->yenes cnt)
  (/ cnt 32.72))



;;Ejemplos
(cambio 1000 pesos->dolares)
(cambio 1000 pesos->euros)
(cambio 1000 pesos->yenes)