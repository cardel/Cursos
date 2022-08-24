;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname vectores) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(require racket/vector)

(define vector1 (make-vector 10))
(display vector1)
(display "\n")
(define vector2 (list->vector (list 1 2 3 4 5 6)))
(display vector2)
(display "\n")
(vector-set! vector2 3 15)
(display vector2)
(display "\n")
(vector-ref vector2 5)

(vector-drop vector2 2)