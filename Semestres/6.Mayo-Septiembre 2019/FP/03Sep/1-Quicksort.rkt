;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname 1-Quicksort) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;Autor: Carlos A Delgado
;;Fecha: 03 de Septiembre

;;custom-quicksort: lista de numeros -> lista de numeros
(define (custom-quicksort lst)
  (cond
    [(empty? lst) empty]
    [else
     (append
      (custom-quicksort (menores-que-pivote lst (first lst)))
      (list (first lst))
      (custom-quicksort (mayores-que-pivote lst (first lst)))
      )
     ]
    ))


;;fitrol: lista de numeros, (numero->booleano) -> lista de nuneros
(define (filtro lst f)
  (cond
    [(empty? lst) empty]
    [(f (first lst)) (cons (first lst) (filtro (rest lst) f))]
    [else (filtro (rest lst) f)]
    )
  )

;;menores-que-pivote: lista de numeros, numero -> lista de numeros
(define (menores-que-pivote lst pivote)
  (filtro lst (lambda (x) (< x pivote))))

;;mayores-que-pivote lista de numeros, numero -> lista de numeros

(define (mayores-que-pivote lst pivote)
  (filtro lst (lambda (x) (> x pivote))))

