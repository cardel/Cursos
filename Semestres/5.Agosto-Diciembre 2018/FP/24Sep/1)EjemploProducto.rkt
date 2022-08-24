;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1)EjemploProducto|) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;; Estructura usada: (define-struct producto (nombre, codigo, precio)
;;Autor: <Su nombre>
;;Fecha: <Fecha de hoy>
;;Contrato: incremento-precio: producto, numero -> producto
;;Propósito: Esta función recibe un producto y un número, retorna el mismo producto pero con el campo precio sumado con el número recibido. Si el incremento es mayor que 500, se asume solo el incremento como precio.
;; Ejemplos
;;(incremento-precio (make-producto "Gelatina" "10012" 100) 100) -> (make-producto "Gelatina" "10012" 200)
;;(incremento-precio (make-producto "Gelatina" "10012" 100) 1000) -> (make-producto "Gelatina" "10012" 1000)

(define-struct producto (nombre codigo precio))

  
(define (incremento-precio prod inc)
  (cond
    [(and (producto? prod) (number? inc))
     (cond
       [(< inc 500)
        (make-producto
         (producto-nombre prod)
         (producto-codigo prod)
         (+ (producto-precio prod) inc))]
       [else
        (make-producto
         (producto-nombre prod)
         (producto-codigo prod)
         inc)
        ]
       )]
    [else
     (error "Debe ingresar los datos correcto")]
    )
  )

(check-expect (incremento-precio (make-producto "Gelatina" "10012" 100) 100) (make-producto "Gelatina" "10012" 200))
(check-expect (incremento-precio (make-producto "Gelatina" "10012" 100) 1000)(make-producto "Gelatina" "10012" 1000))