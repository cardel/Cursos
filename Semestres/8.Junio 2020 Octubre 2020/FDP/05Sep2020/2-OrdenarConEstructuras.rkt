;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 2-OrdenarConEstructuras) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;;Definciones estructuras
(define-struct email (remitente destinario mensaje))

;;Autor: Carlos A Delgado
;;Fecha: 5 de Septiembre de 2020
;;Contrato: ordenar: lista de email -> lista de email
;;Propósito: Ordenar de menor a mayor un alista de email de acuerdo al remitente
;;Ejemplos
;;( (make-email "juan" "carlos" "hola")  (make-email "maria" "juan" "pagame") (make-email "ana" "carlos" "regreso a las 5") ) -> ;;((make-email "ana" "carlos" "regreso a las 5")  (make-email "juan" "carlos" "hola")  (make-email "maria" "juan" "pagame") ) 

(define (ordenar lstnum)
  (cond
    [(empty? lstnum) empty]
    [else (ordenarAux (first lstnum) 
            (ordenar (rest lstnum)) )]
    ))


(check-expect (ordenar (list  (make-email "juan" "carlos" "hola") (make-email "maria" "juan" "pagame") (make-email "ana" "carlos" "regreso a las 5"))) (list (make-email "ana" "carlos" "regreso a las 5") (make-email "juan" "carlos" "hola") (make-email "maria" "juan" "pagame") ))

;;Contrato: OrdenarAux: email, lista de email -> lista de email
(define (ordenarAux elemento lstOrdenada)
  (cond
    [(empty? lstOrdenada) (cons elemento empty)]
    [(string<? (email-remitente elemento) (email-remitente (first lstOrdenada))) (cons elemento lstOrdenada)]
    [else (cons (first lstOrdenada) (ordenarAux elemento (rest lstOrdenada)))]
    ))

