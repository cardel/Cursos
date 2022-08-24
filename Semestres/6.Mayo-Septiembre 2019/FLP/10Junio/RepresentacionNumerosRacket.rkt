;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname RepresentacionNumerosRacket) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
#lang eopl
;;Autor: Carlos A Delgado
;;Fecha: 10 de Junio de 2019

;;CLase abstracción de datos

;;*****************
;;Representación de números naturales
;;*****************

;;Interfaz
(define zero 0)

(define is-zero?
  (lambda (n)
    (= n 0)))

(define succesor
  (lambda (n)
    (+ n 1)))

(define predecesor
  (lambda (n)
    (- n 1)))


;;*********************************
;;Funciones a partir de la representación
;;*********************************

(define plus
  (lambda (x y)
    (cond
      [(is-zero? y) x]
      [else (plus (succesor x) (predecesor y))]
      )
    )
  )
      