;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6-ValidacionDatos) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
(define-struct amigo (nombre color-ojos edad))

;;Pensar en una función que nos dice si es mayor de edad o no

;;Autor: Carlos A Delgado
;;Fecha: 25 Nov de 2019
;;Contrato: mayor-edad: amigo -> booleano
;;Descripción: Determina si un amigo tiene 18 años o mas (mayor de edad)
;;Ejemplos
;;(mayor-edad (make-amigo 'Jose 'Marron 17)) Falso
;;(mayor-edad (make-amigo 'Maria 'Verdes 21) Verdadero
(define (mayor-edad am)
  (cond
    [(amigo? am)
     (if
      (>= (amigo-edad am) 18)
      #T
      #F)
     ]
    [else (error "La entrada debe ser una estructura amigo")]))

(check-expect (mayor-edad (make-amigo 'Jose 'Marron 17)) #F)
(check-expect (mayor-edad (make-amigo 'Maria 'Verdes 21)) #T)

;;Para esto tenemos las funciones

;;number? Numeros
;;symbol? simbolos
;;string? cadenas de texto
;;boolean? booleanos


(define-struct carro (num_llantas num_serial num_pasajeros placa color motor))
(define-struct motor (cilindraje marca gas? gasolina?))

(define carroA
  (make-carro 4 "sdasd" 5 "AFD123" 'Rojo (make-motor 1200 'Toshiba false true)))

;;Diseñar una función que permite cambiar num_llantas (num) y la placa (string)

;;Autor: Carlos A Delgado
;;Fecha: 25 de Nov de 2019
;;Contrato: cambiar-datos-carro: carro, num, string -> carro
;;Propósito: Cambiar el num_llantas y la placa de un carro dado
;;Ejemplos
;;(cambiar-datos-carro (make-carro 3 "sdad" 4 "CDA123" 'Azul (make-motor 1300 'Toshiba true true)) 10 "ABC123")
;;(make-carro 10 "sdad" 4 "ABC123" 'Azul make-motor 1300 'Toshiba true true))
(define (cambiar-datos-carro ca num_llantas placa)
  (if (and (carro? ca) (number? num_llantas) (string? placa))
      (make-carro
       num_llantas
       (carro-num_serial ca)
       (carro-num_pasajeros ca)
       placa
       (carro-color ca)
       (carro-motor ca))
      (error "El primer argumento debe ser carro, el segundo debe ser un numero y el tercero un string")
))

(check-expect (cambiar-datos-carro (make-carro 3 "sdad" 4 "CDA123" 'Azul (make-motor 1300 'Toshiba true true)) 10 "ABC123") (make-carro 10 "sdad" 4 "ABC123" 'Azul (make-motor 1300 'Toshiba true true)))
