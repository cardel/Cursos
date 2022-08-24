;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 5-EjemploEstructurasB) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;;Ejemplos estructuras propias

(define-struct
  datos-persona
  (nombre telefono email)
  )

(define-struct
  email
  (operador capacidad dominio))

(define-struct
  dominio
  (nombre tipo))


(define personaA
  (make-datos-persona "Carlos" "02012" (make-email "microsoft" 40 (make-dominio "hotmail" "com")))
  )

(define personaB
  (make-datos-persona "Pepito" "3805"  (make-email "microsoft" 30 "@hotmail.com")))  

(define personaC
  (make-datos-persona "Andres" "4508" (make-email "microsoft" 35 "@hotmail.com")))