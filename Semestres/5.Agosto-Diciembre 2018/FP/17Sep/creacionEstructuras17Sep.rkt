;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname creacionEstructuras17Sep) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;;Definiciones de estructuras
(define-struct pelicula (titulo productor))
(define-struct amigo (nombre edad color-pelo color-ojos))
(define-struct carro (marca color costo))
(define-struct anime (nombre genero))

;;Construcción de estructuras

(define pelicula1 (make-pelicula 'StarWarsXII 'Disney))
(define pelicula2 (make-pelicula 'LaTumbaDeLasLuciernagas 'Tarantino))
(define pelicula3 (make-pelicula 'Titanic 'Aburrida))

(pelicula-titulo pelicula2)
(pelicula-productor pelicula2)
(pelicula-titulo (make-pelicula 'ElZorro 'NoLaEntiendo))


(define amigo1 (make-amigo "Pedro" 15 "Verde" "Rojos"))
(define amigo2 (make-amigo "Andres" 17 "Negro" "Azul"))
(define amigo3 (make-amigo "Pepito Perez" 23 "Morado" "Negro"))

(amigo-nombre amigo1)
(define amigo2Edad (amigo-edad amigo2))
(define amigo3Nombre (amigo-nombre amigo3))

(define carro1 (make-carro 'Logan "Negro" 3000))
(define carro2 (make-carro 'Lamborgini "Rojo" 5000))
(define carro3 (make-carro 'Ferrari "Azul" 10000))

(define b 5000)
(> b (carro-costo carro1))

(define anime1 (make-anime "Konosuba" "Comedia"))
(define anime2 (make-anime "Naruto" "Relleno"))
(define anime3 (make-anime "One Piece" "Nunca se va acabar :("))