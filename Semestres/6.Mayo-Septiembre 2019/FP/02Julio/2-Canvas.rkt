;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2-Canvas) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
(start 500 500)

(draw-solid-line (make-posn 0 0) (make-posn 250 250))

(draw-solid-rect (make-posn 25 30) 50 40 'red)

(draw-solid-disk (make-posn 150 300) 80 'cyan)

(draw-circle (make-posn 150 300) 85 'black)

(draw-solid-string (make-posn 300 200) "La zero")

