;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 2-BuscarSimboloListasDeListas) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;;Autor: Carlos A Delgado
;;Fecha: 03 de Feb de 2020
;;Contrato: buscar-simbolo: lista de lista de simbolos, simbolo -> booleano
;;Propósito: Esta función indica si existe un símbolo dentro de una lista de lista de símbolos
;;Ejemplos
;;(buscar-simbolo (list 'a (list 'b 'c 'd (list 'z)) 'd (list 'x))) 'z)  true
;;(buscar-simbolo (list 'a (list 'b 'c 'd (list 'z)) 'd (list 'x))) 'j)  false
(define (buscar-simbolo listaS sim)
  (cond
    [(empty? listaS) false]
    [(eq? (first listaS) sim) true]
    [(cons? (first listaS))
     (or
      (buscar-simbolo (first listaS) sim)
      (buscar-simbolo (rest listaS) sim))]
    [else
     (buscar-simbolo (rest listaS) sim)]))


(check-expect (buscar-simbolo (list 'a (list 'b 'c 'd (list 'z)) 'd (list 'x)) 'z)  true)
(check-expect (buscar-simbolo (list 'a (list 'b 'c 'd (list 'z)) 'd (list 'x)) 'j)  false)
