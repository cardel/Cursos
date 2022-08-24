;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 3Estructuras) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))

(define l (cons (cons 1 (cons (cons 1 (cons 2 empty)) (cons 3 empty))) (cons 3 (cons 4 empty))))

;;Contrato: Lista de lista numeros -> numero

(define (suma l)
  (cond
    [(empty? l) 0]
    [(list? (first l)) (+ (suma (first l)) (suma (rest l)))]
    [else
     (+ (first l) (suma (rest l)))]
    )
  )

(suma l)