;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 3-ProblemaEstructurasVersionA) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;;Ejemplo de modificación de estructuras

(define-struct computador (marca modelo precio color serial))

(define computadorA (make-computador 'HP 'Xenon 1500 'rojo 23123))
(define computadorB (make-computador 'Asus 'Rock 1700 'negro 31232))
(define computadorC (make-computador 'Lenovo 'Yoga 2500 'gris 23213))

;;Autor: Carlos A Delgado
;;Fecha: 25 de Nov de 2019
;;Contrador: incrementar-precio: computador -> computador
;;Propósito: Incrementar en un 10% el precio de un computador
;;Ejemplos
;;(incrementar-precio computadorA) -> (make-computador 'HP 'Xenon 1650 'rojo 23123)
;;(incrementar-precio computadorB) -> (make-computador 'Asus 'Rock 1870 'negro 31232)
;;(incrementar-precio computadorC) -> (make-computador 'Lenovo 'Yoga 2750 'gris 23213)
(define (incrementar-precio comp)
  (make-computador
   (computador-marca comp)
   (computador-modelo comp)
   (* 1.1 (computador-precio comp))
   (computador-color comp)
   (computador-serial comp)))


(check-expect (incrementar-precio computadorA) (make-computador 'HP 'Xenon 1650 'rojo 23123))
(check-expect (incrementar-precio computadorB) (make-computador 'Asus 'Rock 1870 'negro 31232))
(check-expect (incrementar-precio computadorC) (make-computador 'Lenovo 'Yoga 2750 'gris 23213))

;;(define-struct computador (marca modelo precio color serial))

;;Incremento
;;10% si el color es 'azul
;;20% si el color es 'rojo
;;15% si el color es 'gris
;;5% si el color es 'blanco
;;25% si el color es 'verde
;;75% si el color es 'dorado
;;40% en otro caso

;;Autor: Carlos A Delgado
;;Fecha: 25 de Nov de 2019
;;Contrato: incremento-por-color: computador -> computador
;;Propósito: Realizar un incremento en el precio de un computador de acuerdo a su color
;;Ejemplos
;;(incremento-por-color (make-computador 'Asus 'Quemado 3000 'azul 123)
;;  Retorna (make-computador 'Asus 'Quemado 3300 'azul 123)
;;(incremento-por-color (make-computador 'Lenovo 'Yoga 4000 'rojo 124))
;; Retorna (make-computador 'Lenovo 'Yoga 4800 'rojo 124)
;;(incremento-por-color (make-computador 'Dell 'Aspire 2000 'gris 125))
;;Retorna (make-compuador 'Dell 'Aspire 2300 'gris 125)
;;(incremento-por-color (make-comṕutador 'Asus 'Automate 6000 'blanco 126))
;;Retorna (make-computador 'Asus 'Automate 6300 'blanco 126))
;;(incremento-por-color (make-computador 'Apolo 'China 2500 'verde 127))
;;Retorna (make-computador 'Apolo 'China 3125 'verde 127)
;;(incremento-por-color (make-computador 'Toshiba 'Placido 5000 'dorado 128))
;;Retorna (make-computador 'Toshiba 'Placido 8750 128)
;;(incremento-por-color (make-computador 'Alien 'Alien 1000 'naranja 129))
;;(make-computador 'Alien 'Alien 1400 'naranja 129)
(define (incremento-por-color comp)
  (cond
    [(equal? (computador-color comp) 'azul)
     (make-computador
      (computador-marca comp)
      (computador-modelo comp)
      (* 1.1 (computador-precio comp))
      (computador-color comp)
      (computador-serial comp))]
    [(equal? (computador-color comp) 'rojo)
     (make-computador
      (computador-marca comp)
      (computador-modelo comp)
      (* 1.2 (computador-precio comp))
      (computador-color comp)
      (computador-serial comp))]
    [(equal? (computador-color comp) 'gris)
     (make-computador
      (computador-marca comp)
      (computador-modelo comp)
      (* 1.15 (computador-precio comp))
      (computador-color comp)
      (computador-serial comp))]
    [(equal? (computador-color comp) 'blanco)
     (make-computador
      (computador-marca comp)
      (computador-modelo comp)
      (* 1.05 (computador-precio comp))
      (computador-color comp)
      (computador-serial comp))]
    [(equal? (computador-color comp) 'verde)
     (make-computador
      (computador-marca comp)
      (computador-modelo comp)
      (* 1.25 (computador-precio comp))
      (computador-color comp)
      (computador-serial comp))]
    [(equal? (computador-color comp) 'dorado)
     (make-computador
      (computador-marca comp)
      (computador-modelo comp)
      (* 1.75 (computador-precio comp))
      (computador-color comp)
      (computador-serial comp))]
    [else
     (make-computador
      (computador-marca comp)
      (computador-modelo comp)
      (* 1.4 (computador-precio comp))
      (computador-color comp)
      (computador-serial comp))]
    )
  )

;;Pruebas

(check-expect (incremento-por-color (make-computador 'Asus 'Quemado 3000 'azul 123)) (make-computador 'Asus 'Quemado 3300 'azul 123))
(check-expect (incremento-por-color (make-computador 'Lenovo 'Yoga 4000 'rojo 124))
 (make-computador 'Lenovo 'Yoga 4800 'rojo 124))
(check-expect(incremento-por-color (make-computador 'Dell 'Aspire 2000 'gris 125))
 (make-computador 'Dell 'Aspire 2300 'gris 125))
(check-expect(incremento-por-color (make-computador 'Asus 'Automate 6000 'blanco 126))
 (make-computador 'Asus 'Automate 6300 'blanco 126))
(check-expect(incremento-por-color (make-computador 'Apolo 'China 2500 'verde 127))
(make-computador 'Apolo 'China 3125 'verde 127))
(check-expect(incremento-por-color (make-computador 'Toshiba 'Placido 5000 'dorado 128))
 (make-computador 'Toshiba 'Placido 8750 'dorado 128))
(check-expect(incremento-por-color (make-computador 'Alien 'Alien 1000 'naranja 129))
(make-computador 'Alien 'Alien 1400 'naranja 129))