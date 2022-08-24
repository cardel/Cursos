;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname SetBeginyVector) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
;;Secuencialidad

(define (f x)
  (begin
    (display "hola\n")
    (display "jaja\n")
    (+ x 2)))

(f 10)

(define a 10)
(display a)

(set! a 12)
(display a)

(display "\n")
(define vector1 (make-vector 10))

(vector-ref vector1 3)

(vector-set! vector1 3 10)