;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 1-Condicionales) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
;14 de Diciembre de 2020

(and false false false)
(and true true false)

(or false false false)
(or true false false)
(or false false false false true)

(not true)
(not false)

;;Operadores numéricos

(= 3 2)
(> 3 4)
(>= 3 3)
(not (>= 3 3))

(or (>= 3 3)  (>= 2 3))
(and (>= 3 3)  (>= 2 3))

(equal? "hola" 3)
(equal? "3" 3)
(equal? 3.0 3)

(equal? "hola" "hola")

(equal? "3" "tres")
(equal? "3" "three")
(equal? "3" "3.0")


;;Verificar area (Ejemplo diapositivas)

;;Autor: Carlos A Delgado S
;;Fecha: 14 de Dic de 2020
;;Contrato: verificar-area: numero, numero -> booleano
;;Propósito: Esta función sirve para verificar si un area dada corresponde a la de un cuadrado de lado L
;;Ejemplos
;;(verificar-area 16 8) false
;;(verificar-area 64 8) true
;;(verificar-area 49 7) true
;;(verificar-area 48 7) false
;;Codigo
(define (verificar-area area lado)
  (= (* lado lado) area))

(check-expect (verificar-area 16 8) false) 
(check-expect (verificar-area 64 8) true) 
(check-expect (verificar-area 49 7) true) 
(check-expect (verificar-area 48 7) false)

;;Predicados

"Predicados"
(number? 8) ;;True
(number? 'a) ;;False
(symbol? 8) ;;False
(symbol? "a") ;;False
(symbol? 'a) ;;True
(string? "hola") ;True
(string? 8) ;False
(odd? 8) ; False
(odd? 7) ; True
(even? 8) ;True
(even? 7) ; False

;Condicionales

;;Diseñe la función del ejemplo

;;Autor: Carlos A Delgado
;;Fecha 14 de Diciembre de 2020
;;Contrato: verificar-edad: numero->texto
;;Propósito: Esta función recibe un número que indica la edad de una persona y de acuerdo a la edad emite un mensaje
;;Ejemplo
;;(verificar-edad 1) "Eres un niño"
;;(verificar-edad 5) "Eres un niño grande"
;;(verificar-edad 10) "Eres un adolescente"
;;(verificar-edad 20) "Eres un adulto"
;;(verificar-edad -10) Debe emitir un error
(define (verificar-edad edad)
  (cond
    [(and (>= edad 0) (< edad 5)) "Eres un niño"]
    [(and (>= edad 5) (< edad 10)) "Eres un niño grande"]
    [(and (>= edad 10) (< edad 20)) "Eres un adolescente"]
    [(>= edad 20) "Eres un adulto"]
    [else (error "Debes ingresar una edad mayor o igual a 0")]
    ))

(check-expect (verificar-edad 1) "Eres un niño")
(check-expect (verificar-edad 5) "Eres un niño grande")
(check-expect (verificar-edad 10) "Eres un adolescente")
(check-expect (verificar-edad 20) "Eres un adulto")
(check-error (verificar-edad -10))

;;PRoblema de venta de CD

;;Autor: Carlos Andres Delgado
;;Fecha: 14 de Diciembre de 2020
;;Contrato: calcular-venta-CD: numero -> numero
;;Propósito: Calcular el valor de la venta de unos CD de acuerdo al número que se compra
;;Ejemplos
;;Compro 1 CD ¿Cuanto pago? 4000
;;Compro 2 CD ¿Cuanto pago? 7000
;;Compro 5 CD ¿Cuanto pago? 17500
;;Compro 8 CD ¿Cuanto pago? 24000
(define (calcular-venta-CD numCD)
  (cond
    [(and (>= numCD 0) (< numCD 2)) (* numCD 4000)]
    [(and (>= numCD 2) (<= numCD 5)) (* numCD 3500)]
    [(> numCD 5) (* numCD 3000)]
    [else (error "El número de CD debe ser un número positivo")]
    ))

(check-expect (calcular-venta-CD 1) 4000)
(check-expect (calcular-venta-CD 2) 7000)
(check-expect (calcular-venta-CD 5) 17500)
(check-expect (calcular-venta-CD 8) 24000)
(check-error (calcular-ventaCD -2))


;;IVA
;;Autor: Carlos A Delgado
;;Fecha: 14 de Dic de 2020
;;contrato: calcular-venta-CD-IVA: numero -> numero
;;Propósito: Calcular la venta de CD considerando el IVA
;;Ejemplos
;;Compro 1 CD, ¿cuanto pago? 4800
;;Compro 2 CD ¿Cuanto pago? 8050
;;Compro 5 CD ¿Cuanto pago? 20125
;;Compro 8 CD ¿Cuanto pago? 27120
(define (calcular-venta-CD-IVA numCD)
  (cond
    [(and (>= numCD 0) (< numCD 2)) (* 1.2 numCD 4000)]
    [(and (>= numCD 2) (<= numCD 5)) (* 1.15 numCD 3500)]
    [(> numCD 5) (* 1.13 numCD 3000)]
    [else (error "El número de CD debe ser un número positivo")]
    ))

(check-expect (calcular-venta-CD-IVA 1) 4800)
(check-expect (calcular-venta-CD-IVA 2) 8050)
(check-expect (calcular-venta-CD-IVA 5) 20125)
(check-expect (calcular-venta-CD-IVA 8) 27120)
(check-error (calcular-ventaCD -2))