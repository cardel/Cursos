;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2-EstructurasGeneral) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
;;Estructuras en general
;;Para definir estructuras usamos define-struct no confundir con el define
(define-struct datos-persona
  (nombre email telefono))

;;Crea la función make-datos-persona: Esta función sirve para crear una nueva estructura del tipo que usted ha indicado
;;Cuando creas una estructura con un nombre cualquiera, crear la función make-<nombre estructura>
(define datosPersonaA
  (make-datos-persona "Ana" "ana@gmail.com" 123456))

;;Funciones que se van a crear <nombre estructura>-campo sirve para extraer la información
;;Ene el caso datos-persona se van a crear las siguientes funciones
;;datos-persona-nombre
;;datos-persona-email
;;datos-persona-telefono

(datos-persona-nombre datosPersonaA)
(datos-persona-email datosPersonaA)
(datos-persona-telefono datosPersonaA)

;;Ultima función <nombre-estructura>?

(datos-persona? 4)
(datos-persona? datosPersonaA)
(datos-persona? (make-datos-persona "Juan" "juan@gmail.com" 23132))