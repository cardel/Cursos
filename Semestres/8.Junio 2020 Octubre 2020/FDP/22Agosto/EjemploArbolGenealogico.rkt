;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname EjemploArbolGenealogico) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
(define-struct hijo (padre madre nombre fecha ojos))

(define carl (make-hijo empty empty 'Carl 1926 'verde))
(define bettina (make-hijo empty empty 'Bettina 1926 'verde))

(define adam (make-hijo carl bettina 'Adam 1950 'amarillos))
(define dave (make-hijo carl bettina 'Dave 1955 'black))
(define eva (make-hijo carl bettina 'Eva 1965 'blue))
(define fred (make-hijo empty empty 'Fred 1966 'rosados))

(define gustav (make-hijo eva fred 'Gustav 1988 'marrones))