;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 1.EstructurasPosn) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))

(define punto1 (make-posn 1 2))

(define punto2 (make-posn 2 3))

(define punto3 (make-posn -2 -9))

;;¿Como podemos trabajar la información?
;;Estructura posn: x   y
(posn-x punto1)
(posn-y punto1)
(posn-y punto3)


;;Función: Calcular la distancia entre dos puntos

;;Autor: Carlos A Delgado
;;Fecha: 20 de Enero de 2021
;;Contrato: calcular-distancia: posn posn -> numero
;;Descripción: Esta función recibe dos puntos en un plano cartesiano y nos retorna la distancia entre ellos
;;Ejemplo
;;(0,0)  (4,4)  = raiz(16+16) = raiz(32) = raiz(16.2) = 4raiz(2) = 5.6568
;;(3,3)  (8,7)  = raiz(25+16) = raiz(41) = 6.4031
(define (calcular-distancia p1 p2)
  (sqrt (+ (sqr (- (posn-x p2) (posn-x p1)))
           (sqr (- (posn-y p2) (posn-y p1))))))


(check-within (calcular-distancia (make-posn 0 0) (make-posn 4 4))  5.6568 0.001)
(check-within (calcular-distancia (make-posn 3 3) (make-posn 8 7))  6.4031 0.001)

;;Función: que toma 3 puntos p0 p1 p2, e indica cual punto p1 o p2 está más cerca de p0


;;Autor: Carlos A Delgado
;;Fecha: 20 de Enero de 2020
;;Contrato: punto-mas-cercano: posn posn posn -> posn
;;Descripción: Esta función toma 3 puntos p0, p1 y p2, y retorna el punto p1 o p2 que sea más cercano a p0
;;Ejemplo
;;p0 = (1 1)  p1 = (1 2) p2 = (4 3)   R/  (1 2)
;;p0 = (4 4)  p1 = (8 6) p2 = (3 4)   R/  (3 4)
(define (punto-mas-cercano p0 p1 p2)
  (cond
    [(< (calcular-distancia p0 p1)
        (calcular-distancia p0 p2)) p1]
    [else p2]))

(check-expect (punto-mas-cercano (make-posn 1 1) (make-posn 1 2) (make-posn 4 3)) (make-posn 1 2))
(check-expect (punto-mas-cercano (make-posn 4 4) (make-posn 8 6) (make-posn 3 4)) (make-posn 3 4))


;fecha:20/01/2021
;autor:luis david mendoza manzano
;contrato: distancia-manhatan : posn posn -> numero
;función: esta función toma dos puntos y determina su distancia manhatan
;ejemplo: (distancia-manhatan (5,4)(2,3)) 4
;código:
(define (distancia-manhatan p0 p1)
          (+ (abs (- (posn-x p1) (posn-x p0))) (abs (- (posn-y p1) (posn-y p0))))
 )
 
(check-expect (distancia-manhatan (make-posn 5 4) (make-posn 2 3)) 4)
