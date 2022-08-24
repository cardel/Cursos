;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2 EjemploFunciones|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Autor: Carlos A Delgado
;Fecha 27 de Junio de 2020
;Contrato: multiplica3 numero, numero, numero -> numero
;Propósito: Multiplicar 3 números que se reciben
;;Ejemplos (multiplica3 1 2 3) 6  , (multiplica3 2 4 5) 40
(define (multiplica3 x y z)
  (* x y z)
  )
;;Pruebas
(check-expect (multiplica3 1 2 3) 6)
(check-expect (multiplica3 2 4 5) 40)
