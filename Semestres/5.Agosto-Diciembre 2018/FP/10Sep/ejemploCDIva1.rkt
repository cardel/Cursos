;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ejemploCDIva1) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))
;;Autor: Docente curso FDP
;;Fecha: 10 Sep 2018
;;Contrato: venta: numero -> numero
;;Propósito: Calcular el total de la venta de los CDs, considerando el IVA
;;Ejemplos: (venta 2) retorna 8050, (venta 10) -> 33900
(define (venta cnt)
  (cond
    [(< cnt 2) (* cnt 4000 (+ 1 (iva cnt)))]
    [(and (>= cnt 2) (<= cnt 5))  (* cnt 3500 (+ 1 (iva cnt)))]
    [else  (* cnt 3000 (+ 1 (iva cnt)))]
    )
  )
;;Pruebas
(check-expect (venta 2) 8050)
(check-expect (venta 10) 33900)


;;Autor: Docente curso FDP
;;Fecha: 10 Sep 2018
;;Contrato: iva: numero -> numero
;;Propósito: Calcular el iva de una venta
;;Ejemplos (iva 1) retorna 0.2, (iva 5) retorna 0.15
(define (iva cnt)
  (cond
    [(< cnt 2) 0.2]
    [(and (>= cnt 2) (<= cnt 5)) 0.15]
    [else 0.13]
    ))
;;pruebas
(check-expect (iva 1) 0.2)
(check-expect (iva 5) 0.15)