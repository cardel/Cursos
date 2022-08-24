;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4Estructuras) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
(define-struct movie (title producer))
(define-struct boyfriend (name hair eyes phone))
(define-struct CD (artist title price))
(define-struct sweater (material size producer))


(define pelicula1 (make-movie "Anaconda" "Aburrido"))
;;Autor: Carlos A Delgado
;;Fecha: 18-Junio de 2019
;;Contrato:crear-pelicula: simbolo, simbolo-> movie
;;Descripción: Esta función permite crear una estructura tipo movie a partir de dos símbolos
;;Ejemplos
;; (crear-pelicula "Naruto" "Relleno") (make-movie "Naruto" "Relleno")
;; (crear-pelicula "Star wars" "Disney") (make-movie "Star wars" "Disney")
(define (crear-pelicula titulo productor)
  (make-movie titulo productor))


(define novioA (make-boyfriend 'Luis 'Rojo 'Amarillos 6666))

;;Autor: Carlos A Delgado
;;Fecha: 18 de Junio de 2019
;;Contrato: cambiar-nombre-novio: boyfriend, simbolo -> boyfriend
;;Descripción: Permite cambiar el nombre de la estructura boyfriend
;;Ejemplos
;;(cambiar-nombre-novio novioA 'Florencio)
;;(make-boyfriend 'Florencio 'Rojo 'Amarillos 6666)
(define (cambiar-nombre-novio nov nom)
  (make-boyfriend
   nom
   (boyfriend-hair nov)
   (boyfriend-eyes nov)
   (boyfriend-phone nov)))

(check-expect  (cambiar-nombre-novio novioA 'Florencio) (make-boyfriend 'Florencio 'Rojo 'Amarillos 6666))