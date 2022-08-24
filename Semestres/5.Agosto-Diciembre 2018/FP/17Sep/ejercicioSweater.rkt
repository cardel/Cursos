;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ejercicioSweater) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
(define-struct movie (title producer))
(define-struct boyfriend (name hair eyes phone))
(define-struct CD (artist title price))
(define-struct sweater (material size producer))

;;Autor: Docente curso FDP
;;Fecha: 17-Sep-2018
;;Contrato: cambiar-artista: CD, simbolo -> CD
;;Proposito: Cambiar el campo de una estrutura CD por un simbolo ingresado
;;Ejemplos.
;;(define cd1 (make-CD 'diomedez 'meemborrache 10))
;;(cambiar-artista cd1 'martinelias) ->
;;(make-CD 'martinelias 'meemborrache 10))
(define (cambiar-artista cd artista)
  (make-CD
   artista
   (CD-title cd)
   (CD-price cd)))

;(define cd1 (make-CD 'diomedez 'meemborrache 10))
;(check-expect
; (cambiar-artista cd1 'martinelias)
; (make-CD 'martinelias 'meemborrache 10))

;;Autor: Docente curso FDP
;;Fecha: 17-Sep-2018
;;Contrato: mejor-sweater: sweater, sweater -> sweater, el campo size de ambos sweater nunca es igual
;;Propósito: Retornar el mejor sweater de acuerdo su size
;;Pruebas
;;(define sw1 (make-sweater 'algodon 12 'china))
;;(define sw2 (make-sweater 'plastico 10 'japon))
;;(mejor-sweater sw1 sw2) -> (make-sweater 'algodon 12 'china)
(define (mejor-sweater s1 s2)
  (cond
    [(> (sweater-size s1)
        (sweater-size s2))
     s1]
    [else s2]
    ))

;;Pruebas
(define sw1 (make-sweater 'algodon 12 'china))
(define sw2 (make-sweater 'plastico 10 'japon))
(check-expect (mejor-sweater sw1 sw2) (make-sweater 'algodon 12 'china))