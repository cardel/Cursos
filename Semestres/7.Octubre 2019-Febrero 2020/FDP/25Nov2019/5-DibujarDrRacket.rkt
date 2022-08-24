;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 5-DibujarDrRacket) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
(start 500 500)

(draw-solid-line (make-posn 0 0) (make-posn 100 100) 'red)

(draw-circle (make-posn 250 250) 100 'yellow)

(draw-solid-disk (make-posn 300 300) 50 'blue)

(draw-solid-string (make-posn 100 100) "Hola mundo")