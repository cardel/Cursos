;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 3-EjemploLocales) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;;Tenemos una estructura venta
;;La estructura tiene un producto, cantidad
;;Tenemos otra estructura producto
;;Producto nombre, costo

(define-struct venta (producto cantidad))

(define-struct producto (nombre costo alta-gamma?))

;;IVA 19%
;;ICL 10% costo > 500000

;;Producto = 50000, compro 20
;;Costo: 1000000
;;IVA: 190000
;;ICL? > 500000  = 100000
;;TOtal: 1290000

(define-struct costo-discriminado (costo iva icl total))


;;Contrato: costo-total: venta ->numero
(define (calcular-costo venta)
  (* (venta-cantidad venta) (producto-costo (venta-producto venta))))

;;Contrato: calcular-iva: venta -> numero
(define (calcular-iva venta)
  (* 0.19 (calcular-costo venta)))

;;Contrato: calcular-icl: venta -> numero
(define (calcular-icl venta)
         (*
          (calcular-costo venta)
          (if (or
               (producto-alta-gamma? (venta-producto venta))
               (> (calcular-costo venta) 500000))
              0.1
              0
              )
          )
  )

;;Autor: Carlos A Delgado
;;Fecha: 03 de Feb de 2020
;;Contrato: calcular-venta: venta -> costo-discriminado
;;Ejemplos
;;(calcular-venta (make-venta (make-producto 'banano 1000 false) 42))  42000+7980 = 49980
;;(calcular-venta (make-venta (make-producto 'tv 800000 false) 2)  1600000+304000+160000 = 2064000
;;(calcular-venta (make-venta (make-producto 'moto 400000 true) 1) 400000+76000+40000 = 516000
(define (calcular-venta venta)
  (local
    (
     (define costo (calcular-costo venta))
     (define iva (calcular-iva venta))
     (define icl (calcular-icl venta))
     )
    (make-costo-discriminado
     costo
     iva
     icl
     (+ costo iva icl)
     )
    )
  )


(check-expect (calcular-venta (make-venta (make-producto 'banano 1000 false) 42))  (make-costo-discriminado
 42000
 7980
 0
 49980))
(check-expect (calcular-venta (make-venta (make-producto 'tv 800000 false) 2))  (make-costo-discriminado
 1600000
 304000
 160000
 2064000))
(check-expect (calcular-venta (make-venta (make-producto 'moto 400000 true) 1))  (make-costo-discriminado
 400000
 76000
 40000
 516000))

