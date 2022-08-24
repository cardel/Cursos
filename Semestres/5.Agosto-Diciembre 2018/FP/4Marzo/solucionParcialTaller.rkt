;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname solucionParcialTaller) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
(define-struct producto (codigo nombre disponibilidad))
(define-struct disponibilidad (precio unidades))

;;Autor: Carlos Delgado
;;Fecha: 4 de Marzo de 2019
;;Contrato: consultar: lista de productos, simbolo -> string
;;Descripción: Busca un producto dentro de la lista y retorna una información

(define (consultar lpro cod)
  (cond
    [(empty? lpro) "No se encontró"]
    [(symbol=? (producto-codigo (first lpro)) cod) (generarSalida (first lpro))]
    [else (consultar (rest lpro) cod)]
    )
  )

;;Autor: Carlos Delgado
;;Fecha: 4 de Marzo
;;Contrato: generarSalida: producto -> string
;;Descrpción: Recibe un producto y emite una salida que nombre + precio + cantidad del producto
(define (generarSalida prod)
  (string-append
   (symbol->string (producto-nombre prod))
   " "
   (number->string (disponibilidad-precio (producto-disponibilidad prod)))
   " "
   (number->string (disponibilidad-unidades (producto-disponibilidad prod)))
))

;;EJemplos

(define p1 (make-producto '342H 'Banano (make-disponibilidad 200 30)))
(define p2 (make-producto '123H 'Zanahoria (make-disponibilidad 1000 100)))
(define p3 (make-producto '232H 'Papa (make-disponibilidad 200 10000)))

(define listaP (list p1 p2 p3))

(consultar listaP '232H)

;;Autor: Carlos Delgado
;;Fecha: 4 de Marzo de 2019
;;Contrato: adicionarProducto: lista de productos, producto -> lista de productos
;;Descripción: Esta función permite añadir productos al inventario

(define (adicionarProducto lprod pro)
  (cond
    [(empty? lprod) (cons pro empty)]
    [(symbol=? (producto-codigo (first lprod)) (producto-codigo pro))
     (cons
      (make-producto
       (producto-codigo pro)
       (producto-nombre pro)
       (make-disponibilidad
        (disponibilidad-precio (producto-disponibilidad pro))
        (+
         (disponibilidad-unidades (producto-disponibilidad pro))
         (disponibilidad-unidades (producto-disponibilidad (first lprod)))
         )
        )
       )
      (rest lprod)
      )]
    [else (cons (first lprod) (adicionarProducto (rest lprod) pro))]
    )
  )

(adicionarProducto listaP (make-producto 'H41 'Carne (make-disponibilidad 3000 8)))
(adicionarProducto listaP (make-producto '342H 'Banano (make-disponibilidad 200 12)))
