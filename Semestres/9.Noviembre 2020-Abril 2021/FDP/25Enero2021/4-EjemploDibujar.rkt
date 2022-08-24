;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4-EjemploDibujar) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
(start 600 600)

(draw-solid-line (make-posn 50 50) (make-posn 230 450))

(draw-solid-rect (make-posn 100 50) 70 200 'yellow)

(draw-circle (make-posn 200 200) 100 'blue)

(draw-solid-disk (make-posn 100 100) 200 'green)

(draw-solid-string (make-posn 200 200) "Hola que tal")