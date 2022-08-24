;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 05-Dibujar) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
(start 500 500)

(draw-circle (make-posn 250 250) 50 'red)

(draw-solid-disk (make-posn 50 50) 50 'orange)

(draw-solid-rect (make-posn 0 0) 30 40 'cyan) 

(draw-solid-line (make-posn 250 0) (make-posn 340 340) 'blue)

(draw-solid-string (make-posn 100 100) "Hola mundo")

(draw-solid-disk (make-posn 200 200) 50 'black)  

(draw-circle (make-posn 200 200) 50 'yellow)
