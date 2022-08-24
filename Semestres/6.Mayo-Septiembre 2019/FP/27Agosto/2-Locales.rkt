;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 2-Locales) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;Contrato: operar: numero, numero, (numero, numero -> numero) -> numero

(define (operar f a b)
  (f a b))

;;contrato: numero, numero -> numero
(define (g a b)
  (cond
    [(> a b) (+ a b)]
    [(= a b) (* a b)]
    [else (- a b)]))

;;Contrato: numero, numero -> (numero -> numero)

(define (funcionRara a b)
  (local
    (
    (define (j k) (* (+ a b) (- k 3)))
    )
  j
  )
  )

(define funcion2 (funcionRara 1 2))

