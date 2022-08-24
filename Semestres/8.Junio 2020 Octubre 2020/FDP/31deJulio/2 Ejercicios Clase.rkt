;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2 Ejercicios Clase|) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp")) #f)))
;;autor: valentina cobo bastidas
;;fecha: 31/07/2020

(define-struct pelicula ( titulo productor))

(define pelicula1 (make-pelicula "dumbo" "valentina"))
(define pelicula2 (make-pelicula "bambi" "oscar"))
(define pelicula3 (make-pelicula "wally" "catalina"))

(define-struct amigo (nombre edad color-pelo color-ojos))
(define amigo1 (make-amigo "sebastian" 17 "rojo" "verdes"))
(define amigo2 (make-amigo "andres" 24 "marron" "marron"))
(define amigo3 (make-amigo "diego" 32 "rubio" "azules"))

(define-struct carro (marca color costo))
(define carro1 (make-carro "jeep" "negro-matte" 105000000))
(define carro2 (make-carro "mazda" "azul" 234000000))
(define carro3 (make-carro "mercedes" "blanco" 10000000000))

(define-struct anime (nombre genero))
(define anime1 (make-anime "takataka" "terror"))
(define anime2 (make-anime "yukujiji" "ficcion"))
(define anime3 (make-anime "hukihuki" "drama"))

(pelicula-titulo pelicula1)
(pelicula-productor pelicula2)
(pelicula-titulo pelicula3)

(amigo-nombre amigo1)
(amigo-edad amigo2)
(amigo-color-pelo amigo3)
(amigo-color-ojos amigo2)

(carro-marca carro1)
(carro-color carro2)
(carro-costo carro3)

(anime-nombre anime1)
(anime-genero anime2)
(anime-nombre anime3)