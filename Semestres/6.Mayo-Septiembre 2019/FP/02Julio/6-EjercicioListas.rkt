;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6-EjercicioListas) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;;Autor: Carlos A Delgado
;;Fecha: 02 de Julio de 2019


(define lista-numero (cons 1 (cons 2 (cons 3 (cons 4 empty)))))

;;Contrato: suma-lista: lista-de-numeros -> numero
;;Pruebas
;;(suma-lista lista-numero) -> 10
(define (suma-lista lst)
  (+
   (first lst)
   (first (rest lst))
   (first (rest (rest lst)))
   (first (rest (rest (rest lst))))))

(check-expect (suma-lista lista-numero) 10)

(define listaS1 (cons 'perro (cons 'gallo (cons 'tigre (cons 'caballo empty)))))
(define listaS2 (cons 'dragon (cons 'mula (cons 'unicornio (cons 'ornitorrinco empty)))))

;;Contrato: hay-mula?: lista-de-simbolos ->booleano
;;Prueba
;;(hay-mula? listaS1) Retorna false
;;(hay-mula? listaS2) Retorna true

(define (hay-mula? lst)
  (cond
    [(equal? (first lst) 'mula) true]
    [(symbol=? (first (rest lst)) 'mula) #t]
    [(symbol=? (first (rest (rest lst))) 'mula) true]
    [(symbol=? (first (rest (rest (rest lst)))) 'mula) true]
    [else false]
    ))

(check-expect (hay-mula? listaS1) false)
(check-expect (hay-mula? listaS2) true)


(define (hay-mulaV2? lst)
  (or
   (symbol=? (first lst) 'mula)
   (symbol=? (first (rest lst)) 'mula)
   (symbol=? (first (rest (rest lst))) 'mula)
   (symbol=? (first (rest (rest (rest lst)))) 'mula)
   )
  )
(check-expect (hay-mulaV2? listaS1) false)
(check-expect (hay-mulaV2? listaS2) true)
