;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 8-EjercicioRecursion) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;;Autor: Carlos A Delgado
;;Fecha: 08 de Agosto de 2020
;;Contrato: buscar-simbolo: lista de simbolos, simbolo -> booleano
;;Propósito: Indicar si un símbolo está en una lista
;;Ejemplos
;;(buscar-simbolo (cons 'a (cons 'b (cons 'c (cons 'd (cons 'e empty))))) 'c) #T
;;(buscar-simbolo (cons 'a (cons 'b (cons 'c (cons 'd (cons 'e empty))))) 'f) #F
;;(buscar-simbolo (cons 'a (cons 'b (cons 'c (cons 'd empty)))) 'f) #F
(define (buscar-simbolo lst sym)
  (cond
    [(not (and (list? lst) (symbol? sym))) (error "Debe ingresar una de lista de símbolos y un simbolo")]
    [(empty? lst) #F]
    [(equal? sym (first lst)) #T]
    [else (buscar-simbolo (rest lst) sym)]
    ))

(check-expect (buscar-simbolo (cons 'a (cons 'b (cons 'c (cons 'd (cons 'e empty))))) 'c) #T)
(check-expect (buscar-simbolo (cons 'a (cons 'b (cons 'c (cons 'd (cons 'e empty))))) 'f) #F)
(check-expect(buscar-simbolo (cons 'a (cons 'b (cons 'c (cons 'd empty)))) 'f) #F)
                                                         
