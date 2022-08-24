;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ejercicioEstructuras1) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
(define-struct movie (title producer))
(define-struct boyfriend (name hair eyes phone))
(define-struct CD (artist title price))
(define-struct sweater (material size producer))

;;Autor: Docente curso FDP
;;Fecha: 17 Sep 2018
;;Contrato: crear-pelicula: simbolo, simbolo -> movie
;;Proposito: Crear una estructura tipo movie a partir de dos simbolos
;;Ejemplos (crear-pelicula 'ElAro 'Yo) -> (make-movie 'ElAro 'Yo)
;;         (crear-pelicula 'Batman 'MathavsMartha) -> (make-movie 'Batman 'MathavsMartha)
(define (crear-pelicula titulo productor)
  (make-movie titulo productor))

(check-expect (crear-pelicula 'ElAro 'Yo) (make-movie 'ElAro 'Yo))
(check-expect (crear-pelicula 'Batman 'MathavsMartha) (make-movie 'Batman 'MathavsMartha))
(define pelicula1 (crear-pelicula 'ElAro 'Yo))
;;Autor: Docente curso FDP
;;Fecha: 17-Sep-2018
;;Contrato: cambiar-nombre-novio: boyfriend, simbolo -> boyfriend
;;Ejemplos
;; (define novio1 (make-boyfriend 'santiago 'verde 'negro 3125234145))
;; (cambiar-nombre-novio novio1 'Andres) ->
;; (make-boyfriend 'Andres 'verde 'negro 3125234145)
(define (cambiar-nombre-novio nom boyf)
  (make-boyfriend
   nom
   (boyfriend-hair boyf)
   (boyfriend-eyes boyf)
   (boyfriend-phone boyf)
   )
  )

;;Pruebas
 (define novio1 (make-boyfriend 'santiago 'verde 'negro 3125234145))
(check-expect (cambiar-nombre-novio 'Andres novio1) (make-boyfriend 'Andres 'verde 'negro 31252341451))