;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 3-EjemploEstructuras) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp")) #f)))
;;Esta función va calular la distancia entre dos puntos

;;Autor: Carlos A Delgado
;;Fecha: 25 de Julio de 2020
;;Planteamiento de la función ¿Que necesito para calcular la distancia
;;entre dos puntos, necesito: los x, y de cada punto ¿Cuantas variables salen?
;;p1x, p1y, p2x, p2y
;;Contrato: calcular-distancia: numero,numero,numero,numero -> numero
;;Ejemplo (calcular-distancia 1 1 1 1) 0
;;Ejemplo (calcular-distancia 2 2 1 1) 1.4142
;;Ejemplo (calcular-distancia 3 3 1 1) 2.8284
(define (calcular-distancia p1x p1y p2x p2y)
  (sqrt (+
         (sqr (- p1x p2x))
         (sqr (- p1y p2y))
         )))


(check-within (calcular-distancia 1 1 1 1) 0 0)
(check-within (calcular-distancia 2 2 1 1) 1.4142 0.001)
(check-within (calcular-distancia 3 3 1 1) 2.8284 0.001)

(define punto1 (make-posn 3 4))
(define punto2 (make-posn 4 5))

;;Proporcionar dos funciones
;;posn-x ;;Devolver a x
;;posn-y ;;Devuelve a y

;;Contrato: calcular-distancia-estructura: posn, posn -> numero
;;Ejemplo (calcular-distancia-estructura (make-posn 1 1) (make-posn 1 1)) 0
;;Ejemplo (calcular-distancia-estructura (make-posn 2 2) (make-posn 1 1)) 1.4142
;;Ejemplo (calcular-distancia-estructura (make-posn 3 3)  (make-posn 1 1)) 2.8284
(define (calcular-distancia-estructura p1 p2)
  (sqrt (+
         (sqr (- (posn-x p1) (posn-x p2)))
         (sqr (- (posn-y p1) (posn-y p2)))
         )))

(calcular-distancia-estructura punto1 punto2)
(calcular-distancia-estructura punto1 punto2)
(check-within (calcular-distancia-estructura (make-posn 1 1) (make-posn 1 1)) 0 0)
(check-within (calcular-distancia-estructura (make-posn 2 2) (make-posn 1 1)) 1.4142 0.0001)
(check-within (calcular-distancia-estructura (make-posn 3 3)  (make-posn 1 1)) 2.8284  0.0001)