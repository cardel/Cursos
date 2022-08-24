;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4-EjercicioParcialClase) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
(define-struct empanada (gramos-carne costo gramos-grasa))
(define-struct chunchulo (gramos-carne costo-unidad unidades-compradas))
(define-struct papa-rellena (gramos-carne costo))
(define-struct chorizo (gramos-carne costo color))

(define empanada1 (make-empanada 200 1000 80))
(define chorizo1 (make-chorizo 500 3000 'azul))
(define papa-rellena1 (make-papa-rellena 500 1800))
(define chunchulo1 (make-chunchulo 500 60 15))

(define listaProductos (cons empanada1 (cons chorizo1 (cons papa-rellena1 (cons chunchulo1 empty)))))
(define listaProductosB (cons empanada1 (cons chorizo1 (cons empanada1 (cons chunchulo1 empty)))))


;;calcular-costo-discriminado: producto, simbolo-> numero
(define (calcular-costo-discriminado prod sym)
  (cond
    [(and (empanada? prod) (symbol=? sym 'empanada)) (empanada-costo prod)  ]
    [(and (chorizo? prod) (symbol=? sym 'chorizo)) (chorizo-costo prod)]
    [(and (papa-rellena? prod) (symbol=? sym 'papa-rellena)) (papa-rellena-costo prod)]
    [(and (chunchulo? prod) (symbol=? sym 'chunchulo))
          (*
           (chunchulo-costo-unidad prod)
           (chunchulo-unidades-compradas prod)
           )
          ]
    [else 0]
  )
)


;;Autor. Carlos A Delgado
;;Fecha: 09 de Julio de 2019
;; Lista
;; Primer elemento sym
;; Segundo elemento 'cost
;; Tercer elemento suma de los costos
(define (venta-discriminada lpro sym)
  (cons
   sym
   (cons 'costo
         (cons
          (+
           (calcular-costo-discriminado (first lpro) sym)
           (calcular-costo-discriminado (first (rest lpro)) sym)
           (calcular-costo-discriminado (first (rest (rest lpro))) sym)
           (calcular-costo-discriminado (first (rest (rest (rest lpro)))) sym)
           )

          empty)))
)


(venta-discriminada listaProductos 'empanada)
(venta-discriminada listaProductosB 'empanada)
(venta-discriminada listaProductosB 'papa-rellena)