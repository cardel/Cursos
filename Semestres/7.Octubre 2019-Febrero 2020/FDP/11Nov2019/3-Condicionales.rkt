;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 3-Condicionales) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))
;;Autor: Carlos A Delgado
;;Fecha: 11 de Noviembre de 2019
;;Contrato: verificar-edad: numero -> string
;;Propósito: A partir de una edad generar un texto de salida
;;Ejemplos
;;(verificar-edad -1) --- Error
;;(verificar-edad 1) "Eres un niño"
;;(verificar-edad 8) "Eres un niño grande"
;;(verificar-edad 15) "Eres un adolecente"
;;(verificar-edad 22) "Eres un adulto"
(define (verificar-edad edad)
  (cond
    [(and (>= edad 0) (< edad 5)) "Eres un niño"]
    [(and (>= edad 5) (< edad 10)) "Eres un niño grande"]
    [(and (>= edad 10) (< edad 20)) "Eres un adolecente"]
    [(>= edad 20) "Eres un adulto"]
    [else (error "La edad debe ser mayor que cero")]
    )
  )