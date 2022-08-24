;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4-EjemplosFuncionesEstructuras) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
(define-struct carro (marca color costo))

(define carroA (make-carro "Mazda" "Blanco" 13000000))
(define carroB (make-carro "Chevrolet" "Azul" 20000000))
(define carroC (make-carro "Ferrari" "Negro" 4000000000))

;;Objetivo: Una función que recibe dos carro y nos retorna el carro con mayor valor

;;¿Que tiene que hacer esta función el carro más caro?
;;Tiene comparar costos
;;¿Como extraigo los costos? carro-costo

;;Autor: Carlos A Delgado
;;Fecha: 20 de Enero de 2020
;;Contrato: carro-mas-caro: carro,carro -> carro
;;Ejemplos
;;carroA y carroB retorna carroB
;;carroA y carroC retorna carroC
;;carroB y carroC retorna carroC
(define (carro-mas-caro c1 c2)
  (cond
    [(and (carro? c1) (carro? c2))  (cond
                                      [(< (carro-costo c1) (carro-costo c2)) c2]
                                      [else c1]
                                      
                                      )
                                    ]
    [else (error "La función debe recibir dos estructuras tipo carro")]))

;;Check-expect
(check-expect (carro-mas-caro carroA carroB) carroB)
(check-expect (carro-mas-caro carroA carroC) carroC)
(check-expect (carro-mas-caro carroC carroB) carroC)