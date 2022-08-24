;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 3-EJercicioEstructurasParcial) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;;Segundo problema parcial 1

(define-struct inventario (tipo1 tipo2 tipo3))

(define-struct producto (nombre cantidad valor_unidad))

;;Diseñar una función compra-producto, recibe un símbolo que
;;es el nombre del producto, recibe un número que es la cantidad
;;a comprar

(define inventarioA (make-inventario
                     (make-producto 'masmelo 20 100)
                     (make-producto 'pan 100 2000)
                     (make-producto 'galletas 50 500)))

;;Autor: Carlos A Delgado
;;Fecha: 13 de Enero de 2020
;;Contrato: calcular-costo: producto,  numero -> numero
(define (calcular-costo prod cnt)
  (cond
    [(<= cnt (producto-cantidad prod))
     (* cnt (producto-valor_unidad prod))]
    [else (error "No tengo disponible esa cantidad")]))

;Autor: Carlos A Delgado
;;Fecha: 13 de Enero de 2020
;;Contrato: compra-producto-aux: inventario, simbolo, cantidad -> numero
(define (comprar-producto-aux inv nom cnt)
  (cond
    [(equal? nom (producto-nombre (inventario-tipo1 inv))) (calcular-costo (inventario-tipo1 inv) cnt)]
    [(equal? nom (producto-nombre (inventario-tipo2 inv))) (calcular-costo (inventario-tipo2 inv) cnt)]
    [(equal? nom (producto-nombre (inventario-tipo3 inv))) (calcular-costo (inventario-tipo3 inv) cnt)]
    [else (error "Producto no encontrado")]
    )
  )

;;Función compra-producto
;;Autor: Carlos A Delgado
;;Fecha: 13 de Enero de 2020
;;Propósito: Esta función recibe un inventario, el nombre del producto y la cantidad a comprar
;;Retorna el costo de la compra
;;Contrato: compra-producto: inventario, simbolo, numero -> numero
;;Ejemplos
;;(compra-producto inventarioA 'masmelo 10) -> 1000
;;(compra-producto inventarioA 'masmelo 30) error por cantidad
;;(compra-producto inventarioA 'pan 3) -> 6000
;;(compra-producto inventarioA 'pan -1) -> error de entrada
;;(compra-producto inventarioA 'galletas 10) -> 5000
;;(compra-producto inventarioA 'mango 10) -> error no existe el producto
(define (compra-producto inv nom cnt)
  (cond
    [(> cnt 0)
     (comprar-producto-aux inv nom cnt)
     ]
    [else (error "La cantidad debe ser mayor a 0")]))
  

