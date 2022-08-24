;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 6-AbstraccionFuncional2) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;;Autor: Carlos A Delgado
;;Fecha: 05 de Septiembre de 2020
;;Contrato: calcular-distancia: posn,posn, (posn,posn->numero) -> numero
;;(calcular-distancia (make-posn 0 0) (make-posn 3 3) geometrica) -> (sqrt 18)
;;(calcular-distancia (make-posn 0 0) (make-pons 3 3) manhathan) -> 6
(define (calcular-distancia p0 p1 f)
  (f p0 p1))

(check-within (calcular-distancia (make-posn 0 0) (make-posn 3 3) distancia-geometrica) 4.2426 0.0001)
(check-expect (calcular-distancia (make-posn 0 0) (make-posn 3 3) distancia-manhathan) 6)

;;contrato: distancia-geometrica: posn, posn -> numero
(define (distancia-geometrica p0 p1)
  (sqrt (+ (sqr (- (posn-x p0) (posn-x p1)))
           (sqr (- (posn-y p0) (posn-y p1))))))

;contrato: distancia-manhathan: posn, posn -> numero
(define (distancia-manhathan p0 p1)
  (+ (abs (- (posn-x p0) (posn-x p1)))
     (abs (- (posn-y p0) (posn-y p1)))))