;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 1.Arbol1) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define-struct persona (nombre fecha-nacimiento madre padre))

(define clara (make-persona 'clara 1853 empty empty))
(define juan (make-persona 'juan 1850 empty empty))

(define pedro (make-persona 'pedro 1875 empty empty))
(define sandra (make-persona 'sandra 1876 clara juan))

(define raul (make-persona 'raul 1880 clara juan))
(define liliana (make-persona 'liliana 1883 empty empty))

(define patricia (make-persona 'patricia 1909 sandra pedro))
(define carlos (make-persona 'carlos 1910 sandra pedro))

(define bertha (make-persona 'bertha 1911 liliana raul))

;;Quiero lista la ascendencia de una persona
;;Entra una estructura persona -> sale de una lista de símbolos

;;Autor: Carlos A Delgado
;;Fecha: 08 de Marzo de 2021
;;Contrato: listar-ascendentes: persona -> lista de simbolos
;;Ejemplos
;;clara -> '()
;;patricia -> '('clara 'sandra 'juan 'pedro)
(define (lista-ascendentes per)
  (cond
    [(empty? per) empty]
    [else
     (append
     (if (empty? (persona-madre per)) '() (cons (persona-nombre (persona-madre per)) empty))     
     (if (empty? (persona-padre per)) '() (cons (persona-nombre (persona-padre per)) empty))
     (lista-ascendentes (persona-madre per))
     (lista-ascendentes (persona-padre per))
     )]
    )
)

