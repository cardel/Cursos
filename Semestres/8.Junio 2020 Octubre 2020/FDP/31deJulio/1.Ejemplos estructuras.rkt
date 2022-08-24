;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.Ejemplos estructuras|) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp")) #f)))
(define-struct datos-persona (nombre email telefono))

(define persona1 (make-datos-persona 'Juan "juan@juan.com" 123))
(define persona2 (make-datos-persona 'Maria "maria@maria.com" 234))
(define persona3 (make-datos-persona 'Pedro "pedro@pedro.com" 456))

(datos-persona-nombre persona1)
(datos-persona-email persona1)
(datos-persona-telefono persona1)

(datos-persona? persona1)
(datos-persona? "hola")


