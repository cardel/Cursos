;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2.AccesoListas) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
(define listaA (cons 1 (cons 4 (cons 8 (cons 9 (cons 10 empty))))))

(first listaA)
(rest listaA)
(first (rest listaA))
(first (rest (rest listaA)))
(first (rest (rest (rest listaA))))
(first (rest (rest (rest (rest listaA)))))

(rest (rest (rest (rest (rest listaA)))))
(length listaA)