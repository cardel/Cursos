;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4-Recursion2) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
(define-struct carro (marca modelo costo))

;;Autor: Carlos A Delgado
;;Fecha: 20 de Enero de 2020
;;COntrato: buscar-marca-carro: lista-carros, simbolo -> carro
;;Propósito: Encontrar el carro de una marca dada dentro de una lista de carros
;;Supongamos que todos los carros tienen marca diferente
(define (buscar-marca-carro lcarros marca)
  (cond
    [(empty? lcarros) (error "No se encontró la marca buscada")]
    [(equal? marca (carro-marca (first lcarros)))
     (first lcarros)]
    [else (buscar-marca-carro (rest lcarros) marca)]))


(check-expect (buscar-marca-carro
               (cons (make-carro 'Mazda 2018 90)
                     (cons (make-carro 'Kia 2010 50)
                           (cons (make-carro 'Chevrolet 1980 20) empty)))
               'Kia)
              (make-carro 'Kia 2010 50))

(check-expect (buscar-marca-carro
               (cons (make-carro 'Suzuki 2020 45)
                     (cons (make-carro 'Audi 2015 30)
                           (cons (make-carro 'Toyota 2018 15)
                                 (cons (make-carro 'BMW 2021 18) empty))))
               'BMW)
              (make-carro 'BMW 2021 18))