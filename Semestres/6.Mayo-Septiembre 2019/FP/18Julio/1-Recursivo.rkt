;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 1-Recursivo) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;;Autor: Carlos A Delgado
;;Fecha: 18 de Julio de 2019
;;Contrato: n-es-natural?: numero -> booleano
;;Descripción: Que todo numero natural se define tomando como base a 0, y sumandole 1 sucesivamente podemos encontrar cualquiernumero natural
;;Pruebas (n-es-natural? 50) -> #T, (n-es-natural? 50.5) -> #F


(define (n-es-natural? n)
  (cond
    [(zero? n) #T]
    [(< n 0) #F]
    [else (n-es-natural? (- n 1))]
    )
  )

;(check-expect (n-es-natural? 50) #T)


;;contrato: suma1 numero -> numero
;;Descripción: Suma 1 a un numero
;;Ejemplos (suma1 0) -> 1, (suma1 (suma1 0)) -> 2

(define (suma1 n)
  (+ n 1))

;;Ejemplo factorial

;;COntrato: factorial: numero-> numero
;;Descripción: Retorna el factorial de un número mayor que 0
;;Ejemplos (factorial 5) -> 120 (factorial 1) -> 1 (factorial 0) -> 1

(define (factorial n)
  (cond
    [(= n 1) 1]
    [(= n 0) 1]
    [else (* n (factorial (- n 1)))]
    )
  )

(check-expect (factorial 5) 120)
(check-expect (factorial 1) 1)
(check-expect (factorial 4) 24)