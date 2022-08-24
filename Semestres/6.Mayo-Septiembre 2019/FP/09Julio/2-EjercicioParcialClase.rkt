;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2-EjercicioParcialClase) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))

;;Autor: Carlos A DElgado
;;Fecha: 9 de Julio de 2019
;;Contrato: lista->estructura: simbolo, lista -> producto
;;Proposito: Construir una estructura a partir de una lista

(define-struct empanada (gramos-carne costo gramos-grasa))
(define-struct chunchulo (gramos-carne costo-unidad unidades-compradas))
(define-struct papa-rellena (gramos-carne costo))
(define-struct chorizo (gramos-carne costo color))

(define (lista->estructura sim lst)
  (cond
    [(symbol=? sim 'empanada)
     (make-empanada (first lst) (first (rest lst)) (first (rest (rest lst))))
   ]
    [(symbol=? sim 'chunchulo)
     (make-chunchulo (first lst) (first (rest lst)) (first (rest (rest lst))))
    ]
    [(symbol=? sim 'papa-rellena)
      (make-papa-rellena (first lst) (first (rest lst)) )
      ]
    [(symbol=? sim 'chorizo)
      (make-chorizo (first lst) (first (rest lst)) (first (rest (rest lst))))
      ]
    [else (error "Ha ingresado un símbolo incorrecto")]
    )
  )

;;Ejemplos
(define listaEmpanada (cons 200 (cons 1000 (cons 80 empty))))
(define listaChorizo (cons 500 (cons 3000 (cons 'azul empty))))
(define listaPapaRellena (cons 500 (cons 1800 empty)))

(lista->estructura 'empanada listaEmpanada)
;; Retorna: (make-empanada (200 1000 80))

(lista->estructura 'chunchulo listaChorizo)
;; Retorna: (make-chunchulo (500 3000 'azul))

(lista->estructura 'papa-rellena listaPapaRellena)
;; Retorna: (make-papa-rellena (500 1800))  
