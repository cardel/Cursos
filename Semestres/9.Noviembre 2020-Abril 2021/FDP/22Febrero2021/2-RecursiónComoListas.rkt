;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2-RecursiónComoListas) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
;;Autor: Carlos A Delgado
;;Fecha: 22 de Feb de 2021
;;Contrato: buscar-simbolo: lista de símbolos, simbolo -> booleano
;;Propósito: ilustrar la recursión en listas
;;Ejemplo
;;lista = (cons 'a (cons 'b (cons 'c (cons 'd (cons 'e empty)))))
;;simbolo = 'd  --> True
;;simbolo = 'j  --> False
(define (buscar-simbolo lst sim)
  (cond
    [(empty? lst) #f]  ;;Condición de parada siempre que se llegue a empty
    [(symbol=? (first lst) sim) #t] ;;Pregunta con el primer elemento
    [else (buscar-simbolo (rest lst) sim)] ;;Llamado recursivo
    ))

(define listaA (cons 'a (cons 'b (cons 'c (cons 'd (cons 'e empty))))))
(check-expect (buscar-simbolo listaA 'd) #t)
(check-expect (buscar-simbolo listaA 'j) #f)