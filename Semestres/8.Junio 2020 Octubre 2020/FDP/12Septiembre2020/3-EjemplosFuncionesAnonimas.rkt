;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname 3-EjemplosFuncionesAnonimas) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))

;;Funcion generica que saca hace un filtro de una lista de numeros

;;Autor: Carlos A Delgado
;;Fecha 12 de Septiembre de 2020
;;Filtro: lista de numeros -> lista de numeros
(define (filtro lst f)
  (cond
    [(empty? lst) '()]
    [else
     (local
       (
        (define primero (first lst))
        (define llamadoR (filtro (rest lst) f))
        )
       (cond
         [(f primero) (cons primero llamadoR)]
         [else llamadoR]))]
    )
  )

(define listaA (list 1 2 3 4 5 6 7 8 9 10 11 12 13 14))
(filtro listaA odd?)
(filtro listaA even?)

(filtro listaA (lambda (x) (> x 5)))
(filtro listaA (lambda (x) (and (even? x) (> x 5))))
;;Tienes una lista y quieres devolverlos numeros al cuadrado

(define (aplicar-una-funcion lst f)
  (cond
    [(empty? lst) '()]
    [else (cons (f (first lst)) (aplicar-una-funcion (rest lst) f))]))

(display "Usando recursión\n")
(aplicar-una-funcion listaA (lambda (x) (sqr x)))
(display "Usando map\n")
(map (lambda (x) (sqr x)) listaA)