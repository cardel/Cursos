;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2Estructuras) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
(define-struct datos-persona
  (nombre apellido email))

;;Se va diseñar una función que tome una estructura datos persona, un número y un símbolo
;;Si el numero es 1 se cambia el nombre de la persona
;;Si el numero es 2 se cambia el apellido
;;En otro caso se cambia el email

;;Autor: Carlos A Delgado
;;Fecha: 18 de Junio de 2019
;;Contrato: actualizar-persona: datos-persona, numero, simbolo -> datos-persona
;;Descripción: Esta función permite actualizar los campos de un datos-persona
;;Ejemplos
;;(define personaA (make-datos-persona 'Pedro 'Perez 'pedro@pedro.com))
;;(define personaB (make-datos-persona 'Andres 'Sanchez 'andres@andres.com))
;;(actualizar-persona personaA 1 'Niño)
;;(make-datos-persona 'Niño 'Perez 'pedro@pedro.com)
;;(actualizar-persona personaB 2 'Delgado)
;;(make-datos-persona 'Andres 'Delgado 'andres@andres.com)
;;(actualizar-persona personaA 3 'pedro@perez.com)
;;(make-datos-persona 'Pedro 'Perez 'pedro@perez.com)
(define (actualizar-persona per num sym)
  (cond
    [(= num 1)
     (make-datos-persona
      sym
      (datos-persona-apellido per)
      (datos-persona-email per)
      )]
    [(= num 2)
     (make-datos-persona
      (datos-persona-nombre per)
      sym
      (datos-persona-email per))]
     [else
      (make-datos-persona
       (datos-persona-nombre per)
       (datos-persona-apellido per)
       sym)]
     )
  )

;;Pruebas

(define personaA (make-datos-persona 'Pedro 'Perez 'pedro@pedro.com))
(define personaB (make-datos-persona 'Andres 'Sanchez 'andres@andres.com))
(check-expect (actualizar-persona personaA 1 'Niño) (make-datos-persona 'Niño 'Perez 'pedro@pedro.com))
(check-expect(actualizar-persona personaB 2 'Delgado) (make-datos-persona 'Andres 'Delgado 'andres@andres.com))
(check-expect(actualizar-persona personaA 3 'pedro@perez.com)(make-datos-persona 'Pedro 'Perez 'pedro@perez.com))