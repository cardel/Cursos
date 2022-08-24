;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ejemploActualizarDatos17Sep) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;;Autor: Docente curso FDP
;;Fecha: 16-Sep-2018
;;Contrato: actualizar-datos: numero, datos-persona, simbolo -> datos-persona
;;Ejemplos:
;; (define persona1 (make-datos-persona 'Juan 'Valencia 'juan@gmail.com))
;; (actualizar-datos 1 persona1 'Pedro)
;; Retorna: (make-datos-persona 'Pedro 'Valencia 'juan@gmail.com)
(define-struct datos-persona (nombre apellido email))

(define (actualizar-datos num est sim)
  (cond
    [(= num 1) (make-datos-persona
                sim
                (datos-persona-apellido est)
                (datos-persona-email est))]
    [(= num 2) (make-datos-persona
                (datos-persona-nombre est)
                sim
                (datos-persona-email est))]
    [(= num 3) (make-datos-persona
                (datos-persona-nombre est)
                (datos-persona-apellido est)
                sim)]
    [else (error "Opcion no válida")]
    )
  )
;;Pruebas

(define persona1 (make-datos-persona 'Juan 'Valencia 'juan@gmail.com))
(actualizar-datos 1 persona1 'Pedro)
(actualizar-datos 2 persona1 'Martinez)
(actualizar-datos 3 persona1 'pedro@gmail.com)