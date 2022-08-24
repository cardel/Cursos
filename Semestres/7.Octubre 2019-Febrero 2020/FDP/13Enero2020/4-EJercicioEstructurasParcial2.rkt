;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4-EJercicioEstructurasParcial2) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
(define-struct inventario (tipo1 tipo2 tipo3))
(define-struct producto (nombre cantidad valor_unitario))

(define inventarioA (make-inventario
                     (make-producto 'masmelo 20 100)
                     (make-producto 'pan 100 2000)
                     (make-producto 'galletas 50 500)))

;;Autor: Carlos A Delgado
;;Fecha: 13 de Enero de 2020
;;Contrato: modificar-producto: producto, cnt -> producto
(define (modificar-producto prod cnt)
  (cond
    [(<= cnt (producto-cantidad prod))
     (make-producto
      (producto-nombre prod)
      (- (producto-cantidad prod) cnt)
      (producto-valor_unitario prod)
      )
     ]
    [else (error "No tengo esa cantidad disponible")]))


;;Autor: Carlos A Delgado
;;Fecha: 13 de Enero de 2020
;;Contrato: actualizar-inventario-aux: inventario, simbolo, numero -> inventario
(define (actualizar-inventario-aux inv nom cnt)
  (cond
    [(equal? nom (producto-nombre (inventario-tipo1 inv)))
     (make-inventario
      (modificar-producto (inventario-tipo1 inv) cnt)
      (inventario-tipo2 inv)
      (inventario-tipo3 inv)
      )]
    [(equal? nom (producto-nombre (inventario-tipo2 inv)))
     (make-inventario
      (inventario-tipo1 inv)
       (modificar-producto (inventario-tipo2 inv) cnt)
      (inventario-tipo3 inv)
      )]
    [(equal? nom (producto-nombre (inventario-tipo3 inv)))
     (make-inventario
      (inventario-tipo1 inv)
      (inventario-tipo2 inv)
       (modificar-producto (inventario-tipo3 inv) cnt)
      
      )]
    [else (error "Producto no encontrado")]
  ))


;;Autor: Carlos A Delgado
;;Fecha: 13 de ENero de 2020
;;Contrato: actualizar-inventario: inventario, simbolo, cantidad-> inventario
;;Propósito: Mostrar el inventario después de una compra
;;Ejemplos
;;(actualizar-inventario inventarioA 'pan 2)
;;(make-inventario (make-producto 'masmelo 20 100) (make-producto 'pan 98 2000) (make-producto 'galletas 50 500))
;;(actualizar-inventario inventarioA 'pan -1) error
;;(actualizar-inventario inventarioA 'galletas 52) error
;;(actualizar-inventario inventarioA 'mango 20) error
;;(actualizar-inventario inventarioA 'masmelo 15)
;;(make-inventario (make-producto 'masmelo 5 100) (make-producto 'pan 100 20000) (make-producto 'galletas 50 500))
(define (actualizar-inventario inv nom cnt)
  (cond
    [(> cnt 0) (actualizar-inventario-aux inv nom cnt)]
    [else (error "La cantidad debe ser mayor a 0")]))