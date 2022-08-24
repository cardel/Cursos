;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname CalcularDistanciaPosn) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;;Autor: Docente de FDP
;;Fecha: 10-Sep-2018
;;Contrato: calcular-distancia: posn, posn-> numero
;;Proposito: Dados dos puntos p1 y p2 calcular la distancia entre ellos
;;EJemplos
;;(define p1 (make-posn 21 3))
;;(define p2 (make-posn 21 1))
;;(calcular-distancia p1 p2) -> 2
(define (calcular-distancia a b)
  (sqrt (+
         (sqr (- (posn-x a) (posn-x b)))
         (sqr (- (posn-y a) (posn-y b)))
         )
        )
  )

(define p1 (make-posn 21 3))
(define p2 (make-posn 21 1))
(check-expect (calcular-distancia p1 p2) 2)


