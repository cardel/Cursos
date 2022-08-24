;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ecuacionRaiz) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;;Autor: Docente del curso FDP
;;Fecha: 10-Sep-2018
;;Contrato: chequear-ecuacion: numero,numero,numero -> simbolo
;;Propósito: Indicar si una ecuación de segundo grado: no tiene o tiene una o dos raices reales
;;Ejemplos (chequear-ecuacion 1 2 4) -> 'noTiene
;; (chequear-ecuacion 1 4 4) ->  'una
;; (chequear-ecuacion 1 4 2) ->  'dos
(define (chequear-ecuacion a b c)
  (cond
    [(< (calcular-raiz a b c) 0) 'noTiene]
    [(= (calcular-raiz a b c) 0) 'una]
    [else 'dos]
    )
  )
(check-expect (chequear-ecuacion 1 2 4) 'noTiene)
(check-expect (chequear-ecuacion 1 4 4) 'una)
(check-expect (chequear-ecuacion 1 4 2) 'dos)
;;Autor: Docente del curso FDP
;;Fecha 10-Sep-2018
;;Contrato: calcular-raiz numero, numero,numero -> numero
;;Propósito: calcular la operación b^2 - 4ac
;;Ejemplo
;; (calcular-raiz 1 2 4) -12
;; (calcular-raiz 1 4 4) 0
;; (calcular-raiz 1 4 2) 8
(define (calcular-raiz a b c)
 (- (sqr b) (* 4 a c))
 )