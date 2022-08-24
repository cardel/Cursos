;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 1Estructuras) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;;Enlace https://pastebin.com/AtyqztYA

(define-struct partido
  (equipoA equipoB marcador nombreArbitro estadio))

;;Partido Colombia vs Argentina
(define partidoColombiaArgentina
  (make-partido "Colombia" "Argentina" "2-0" "Pitana" "Villa Real"))

;;Nombre del estadio del partido entre Colombia y Argentina
(partido-estadio partidoColombiaArgentina)

;;Preguntar si algo es una estructura
(partido? 5)
(partido? partidoColombiaArgentina)