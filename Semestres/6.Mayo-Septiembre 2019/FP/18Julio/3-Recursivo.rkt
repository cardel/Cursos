;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 3-Recursivo) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;Autor: Carlos A Delgado
;;Fecha: 18 de Julio de 2019
;;Contrato: buscar-simbolo: lista de simbolos -> booleano

(define (buscar-simbolo lst sym)
  (cond
    [(null? lst) #F]
    [(symbol=? sym (first lst)) #T]
    [else (buscar-simbolo (rest lst) sym)]
    )
  )

(check-expect (buscar-simbolo (cons 'a (cons 'b (cons 'c (cons 'd empty)))) 'h) #F)