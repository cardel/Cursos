;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 5-Recursivo) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;Problema es recibir un numero y construir una lista que va desde ese numero hasta 1

;;Autor: Carlos A Delgado
;;Fecha: 18 de Julio de 2019
;;contrato: crear-lista: numero ->lista de numeros
;;EJemplos
;;(crear-lista 5) (cons 5 (cons 4 (cons 3 (cons 2 (cons 1 empty)))))
(define (crear-lista n)
  (cond
    [(<= n 0) empty]
    [else (cons n (crear-lista (- n 1)))]
    )
  )