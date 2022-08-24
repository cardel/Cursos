;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 3-EjercicioParcialClase) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
(define-struct empanada (gramos-carne costo gramos-grasa))
(define-struct chunchulo (gramos-carne costo-unidad unidades-compradas))
(define-struct papa-rellena (gramos-carne costo))
(define-struct chorizo (gramos-carne costo color))

(define empanada1 (make-empanada 200 1000 80))
(define chorizo1 (make-chorizo 500 3000 'azul))
(define papa-rellena1 (make-papa-rellena 500 1800))
(define chunchulo1 (make-chunchulo 500 60 15))

(define listaProductos (cons empanada1 (cons chorizo1 (cons papa-rellena1 (cons chunchulo1 empty)))))
(define listaProductos2 (cons chorizo1 (cons chorizo1 (cons chorizo1 (cons chorizo1 empty)))))
;;Retorna:  (cons 'gramos-carne (cons 1700 (cons 'costo-total (cons 6700 empty)))) 

;;Tengo una lista de estructuras producto de tamaño de 4
;; COnstruir una lista sea así
;; primer elemento: 'gramos-carne
;; segundo element: suma de los atributos gramos-carne
;; tercer elemento: 'costo-total
;; cuarto elemento: suma de los atributos costo (excepto el caso del chunchulo


;;contrato: extraer-gramos-carne: producto -> numero

(define (extraer-gramos-carne prod)
  (cond
    [(empanada? prod) (empanada-gramos-carne prod)]
    [(chunchulo? prod) (chunchulo-gramos-carne prod)]
    [(papa-rellena? prod) (papa-rellena-gramos-carne prod)]
    [(chorizo? prod) (chorizo-gramos-carne prod)]
    [else (error "El elemento no es un producto")]
    )
  )

;;contrato: extraer-costo: producto -> numero
(define (extraer-costo prod)
  (cond
    [(empanada? prod) (empanada-costo prod)]
    [(chunchulo? prod) (*
                        (chunchulo-costo-unidad prod)
                        (chunchulo-unidades-compradas prod))]
    [(papa-rellena? prod) (papa-rellena-costo prod)]
    [(chorizo? prod) (chorizo-costo prod)]
    [else (error "El elemento no es un producto")]
    )
  )

;;contrato: generar-inventario: lista de productos, simbolo -> lista

(define (generarInventario lsp sym)
  (cons
   'gramosCarne
   (cons
    (+
     (extraer-gramos-carne (first lsp))
     (extraer-gramos-carne (first (rest lsp)))
     (extraer-gramos-carne (first (rest (rest lsp))))
     (extraer-gramos-carne (first (rest (rest (rest lsp)))))
     )
    (cons
     'costo-total
     (cons
    (+
     (extraer-costo (first lsp))
     (extraer-costo (first (rest lsp)))
     (extraer-costo (first (rest (rest lsp))))
     (extraer-costo (first (rest (rest (rest lsp)))))
     )
    empty))
    ))
  )

(generarInventario listaProductos 'ab)
(generarInventario listaProductos2 'ab)
