;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 8-AbstracionVIII) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
;;Autor: Carlos A Delgado
;;Fecha: 22 de Marzo de 2021
;;Contrato: filtro: lista de numeros, (numero,numero->booleano), numero
(define (filtro lst f n)
    (cond
      [(empty? lst) lst]
      [else
       (local
         (
          (define primero (first lst))
          (define recursivo (filtro (rest lst) f n))
          )
          (cond
            [(f primero n)(cons primero recursivo)]
            [else recursivo]
            )
         )
       ]
      )
  )


(define listaA (list 1 2 3 4 5 6 7 8))

"Mayores"
(filtro listaA > 5)
(filtro listaA > 2)
(filtro listaA > 10)

"Menores"
(filtro listaA < 5)
(filtro listaA < 2)
(filtro listaA < 10)

"Mayores que z y pares"
(define (mayor-que-z-pares x n)
  (and (> x n) (even? x)))

(filtro listaA mayor-que-z-pares 5)
(filtro listaA mayor-que-z-pares 2)
(filtro listaA mayor-que-z-pares 10)