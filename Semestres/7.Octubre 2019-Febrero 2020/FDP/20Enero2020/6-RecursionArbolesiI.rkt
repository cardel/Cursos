;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6-RecursionArbolesiI) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
(define-struct arbol (valor hizq hder))

(define arbol1 (make-arbol 5
                           (make-arbol 8
                                       (make-arbol 8 empty empty)
                                       (make-arbol 9 empty empty))
                           (make-arbol 7
                                       (make-arbol 5 empty empty)
                                       (make-arbol 7 empty empty))))

;;Autor: Carlos A Delgado
;;Fecha: 20 de Enero de 2020
;;COntrato: sumar-arbol: arbol -> numero
;;Propósito: Esta función recibe un árbol y retorna la suma de sus valores
;;Ejemplo
;;(sumar-arbol arbol1) --> 49
(define (sumar-arbol arb)
  (cond
    [(empty? arb) 0]
    [else
     (+
      (arbol-valor arb)
      (sumar-arbol (arbol-hizq arb))
      (sumar-arbol (arbol-hder arb))
      )
     ]))

(check-expect (sumar-arbol arbol1) 49)
