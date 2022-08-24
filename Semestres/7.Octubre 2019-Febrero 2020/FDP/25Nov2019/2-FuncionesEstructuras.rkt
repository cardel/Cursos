;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2-FuncionesEstructuras) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;;Ejercicio
;;Vamos a trabajar con un sistema de coordenadas en 3D, x,y z
;;¿Como implemento un punto 3D?

(define-struct punto3D (x y z))

;;Diseñe una función que recibe 3 puntos, y retorna la distancia más
;;corta entre dos puntos

;;Autor: Carlos A Delgado
;;Fecha: 25 de Nov de 2019
;;Contrato: distancia-puntos: punto3D, punto3D -> numero
(define (distancia-punto p1 p2)
  (sqrt
   (+
    (sqr (- (punto3D-x p1) (punto3D-x p2)))
    (sqr (- (punto3D-y p1) (punto3D-y p2)))
    (sqr (- (punto3D-z p1) (punto3D-z p2))))))


;;Autor: Carlos A Delgado
;;Fecha: 25 de Nov de 2019
;;Contrato: punto-mas-cercano: punto3D, punto3D, punto3D -> numero
;;Propósito: Esta función recibe 3 puntos y retorna la distancia(número) más cercana (menor)
;;Ejemplos
;;(punto-mas-cercano (make-punto3D 3.5 2 7.5) (make-punto3D 4 4.5 2) (make-punto3D 8 1 9))-> #i4.847679857416329
;;(punto-mas-cercano (make-punto3D 4 6 2.5) (make-punto3D 5 3 1) (make-punto3D 4 2 1.5)) -> 1.5
(define (punto-mas-cercano puntoA puntoB puntoC)
  (cond
    [(and
      (< (distancia-punto puntoA puntoB) (distancia-punto puntoA puntoC))
      (< (distancia-punto puntoA puntoB) (distancia-punto puntoB puntoC)))
      (distancia-punto puntoA puntoB)]
    [(< (distancia-punto puntoA puntoC) (distancia-punto puntoB puntoC))
     (distancia-punto puntoA puntoC)]
    [else
     (distancia-punto puntoB puntoC)]))


(punto-mas-cercano (make-punto3D 3.5 2 7.5) (make-punto3D 4 4.5 2) (make-punto3D 8 1 9))
;;#i4.847679857416329
(punto-mas-cercano (make-punto3D 4 6 2.5) (make-punto3D 5 3 1) (make-punto3D 4 2 1.5))
;;1.5
