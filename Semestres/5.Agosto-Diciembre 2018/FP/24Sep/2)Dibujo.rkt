;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2)Dibujo|) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
(start 500 500)
(draw-solid-line (make-posn 100 100) (make-posn 200 200))
(draw-solid-line (make-posn 100 100) (make-posn 100 200))

(draw-solid-rect (make-posn 300 200) 100 100  'blue)

(draw-circle (make-posn 250 250) 100 'green)
(draw-solid-disk (make-posn 50 50) 100 'red)