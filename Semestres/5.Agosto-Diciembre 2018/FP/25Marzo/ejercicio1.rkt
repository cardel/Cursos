;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ejercicio1) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "guess.rkt" "teachpack" "htdp")) #f)))

(define (g x y)
  (* x y))

(define piT 2.4)

(define (f x y)
  (local
    (
     (define piT 3.14)
     (define (g x) (if (> x 0) 10 2))
     )
    (* piT (g (+ x y)))
    )
  )

(f 1 2)

