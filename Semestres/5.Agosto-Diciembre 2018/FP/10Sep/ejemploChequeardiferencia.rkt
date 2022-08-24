;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ejemploChequeardiferencia) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))
;;Autor: Docente del curso FDP
;;Fecha: 10 Sep 2018
;;contrato: chequear-diferencia: numero,numero -> simbolo
;;Propósito: Examinar la diferencia entre dos números y retornar un simbolo de acuerdo a una condición
;;Pruebas (chequar-diferencia 1 2) retorna 'pequeño
;;  (chequear-diferencia 10 20) 'pequeño
;;  (chequear-diferencia 1 1) 'igual
;; (chequear-diferencia 20 40) 'grande
(define (chequear-diferencia a b)
  (cond
    [ (= a b) 'igual]
    [ (and (> (abs (- a b)) 0) (<= (abs (- a b)) 10)) 'pequeño]
    [ else 'grande]
    )
  )

(check-expect (chequear-diferencia 1 2)  'pequeño)
(check-expect (chequear-diferencia 10 20) 'pequeño)
(check-expect (chequear-diferencia 1 1) 'igual)
(check-expect (chequear-diferencia 20 40) 'pequeño)




