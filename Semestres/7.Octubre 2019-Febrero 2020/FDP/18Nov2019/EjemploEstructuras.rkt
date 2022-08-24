;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname EjemploEstructuras) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;;Ejemplo estructura

(define punto1 (make-posn 4 5))
(define punto2 (make-posn 3 6))

(posn-x punto1)
(posn-y punto1)

;;Autor: Carlos A Delgado
;;Fecha: 18 de Nov de 2019
;;Contrato: calcular-distancia: posn, posn -> numero
;;Ejemplos
;;(calcular-distancia (make-posn 1 2) (make-posn 3 4)) -> sqrt(8)
;;(calcular-distancia (make-posn 2 3) (make-posn 6 7)) -> srqt(32) -> 4*sqrt(2)
(define (calcular-distancia p1 p2)
  (sqrt (+ (sqr (- (posn-x p1) (posn-x p2)))
           (sqr (- (posn-y p1) (posn-y p2)))
           )
        )
  )

(calcular-distancia (make-posn 1 2) (make-posn 3 4))
(calcular-distancia (make-posn 2 3) (make-posn 6 7))


;;Ejercicio
;;Una función que recibe 3 puntos y retorna el punto más cercano a (0,0)
;;Usen la función de distancia como función auxiliar
;;Consejo comparar (d (0,0) p1) (d (0,0) p2) (d (0,0) p3))

;;Crear (make-posn x y)  .. (posn-x ...) (posn-y ...)


;;Autor: Carlos A Delgado S
;;Fecha: 18 de Nov de 2019
;;Contrato: punto-cercano-origen: posn, posn, posn -> posn
;;Descripción: Esta función determina cual es el punto más cercano al origen entre 3 que se ingresan
;;Ejemplos
;;(punto-cercano-origen (make-posn 3 2) (make-posn 5 6) (make-posn 4 6))
;;Retorna (make-posn 3 2)
;;(punto-cercano-origen (make-posn 2 1) (make-posn 3 2) (make-pons 5 6))
;;Retorna (make-posn 2 1)
(define (punto-cercano-origen p1 p2 p3)
  (cond
    [( and (<
            (calcular-distancia p1 (make-posn 0 0))
            (calcular-distancia p2 (make-posn 0 0)))
           (< (calcular-distancia p1 (make-posn 0 0))
              (calcular-distancia p3 (make-posn 0 0))))
     p1]
    [(< (calcular-distancia p2 (make-posn 0 0))
        (calcular-distancia p3 (make-posn 0 0)))
     p2]
    [else p3]))

(check-expect (punto-cercano-origen (make-posn 3 2) (make-posn 5 6) (make-posn 4 6))
 (make-posn 3 2))
(check-expect(punto-cercano-origen (make-posn 2 1) (make-posn 3 2) (make-posn 5 6))
(make-posn 2 1))
(check-expect(punto-cercano-origen  (make-posn 3 2) (make-posn 5 6) (make-posn 2 1))
(make-posn 2 1))
;;Diseñe una función que recibe 3 puntos p1, p2 y p3
;;Esta función retorna la mayor distancia entre dos puntos
;;Ejempl suponga (distancia p1 p2) - 5, (distancia p1 p3) 8
;; (distania p2 p3) 10 --> Retorna 10



;;Autor: Carlos A Delgado
;;Fecha: 18 de Nov de 2019
;;Contrato: mayor-distancia: posn, posn, posn -> numero
;;Proposito: Retorna la mayor distancia entre 3 puntos
;;Ejemplos
;;(mayor-distancia (make-posn 2 4) (make-posn 6 3) (make-posn 2 5)
;;Primera (sqrt 17), Segunda 1, (sqrt 20)
;;Retorna (sqrt 20)
;;(mayor-distancia (make-posn 5 2) (make-posn 4 3) (make-posn 7 2)
;; Primera (sqrt 2) Segunda 2, Tercara (sqrt 10)
;;Retorna (sqrt 10)
(define (mayor-distancia p1 p2 p3)
  (cond
    [ (and (> (calcular-distancia p1 p2) (calcular-distancia p1 p3))
           (> (calcular-distancia p1 p2) (calcular-distancia p2 p3)))
      (calcular-distancia p1 p2)]
    [(> (calcular-distancia p2 p3) (calcular-distancia p1 p3))
     (calcular-distancia p2 p3)]

    [else (calcular-distancia p1 p3)]
    )
  )

(mayor-distancia (make-posn 2 4) (make-posn 6 3) (make-posn 2 5))

(mayor-distancia (make-posn 5 2) (make-posn 4 3) (make-posn 7 2))

