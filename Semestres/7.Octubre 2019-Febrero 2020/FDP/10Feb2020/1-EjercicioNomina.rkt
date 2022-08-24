;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 1-EjercicioNomina) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
(define-struct ejecutivo (salario num_emp))
(define-struct operativo (salario horas_t))

(define-struct pago (nominal salud pension arl pago recibe))


;;Contrato: calcular-nominal: empleado -> numero
(define (calcular-nominal emp)
  (cond
    [(ejecutivo? emp)
     (if (> (ejecutivo-num_emp emp) 20)
         (* 1.2 (ejecutivo-salario emp))
         (ejecutivo-salario emp))]
    [(operativo? emp)
     (* (operativo-salario emp) (operativo-horas_t emp))]
    [else
     (error "Debe recibirse un empleado")]))

;;Calcular-salud: numero->numero
(define (calcular-salud salario)
  (* 0.4 0.125 salario))

;;Calcular-pension: numero->numero
(define (calcular-pension salario)
  (* 0.4 0.16 salario))

;;Calcular-arl: numero->numero
(define (calcular-arl salario)
  (* 0.4 0.05 salario))

;Autor: Carlos A Delgado
;Fecha: 10 de Febrero de 2020
;Contrato: calcular-nomina: lista de empleados -> lista de pagos
;Descripción: Esta función permite calcular el pago discriminado a un conjunto de empleados de una empresa
;Ejemplos
;(calcular-nomina (list (make-ejecutivo 1000000 21) (make-operativo 5600 30)))
;(list (make-pago 1200000 60000 76800 24000 1296480 1135680)
;      (make-pago 168000 8400 10752 3360 181507.2 158995.2))
(define (calcular-nomina lemp)
  (cond
    [(empty? lemp) '()]
    [else
     (cons
      (local
        (
         (define nominal (calcular-nominal (first lemp)))
         (define salud (calcular-salud nominal))
         (define pension (calcular-pension nominal))
         (define arl (calcular-arl nominal))
         (define total_aportes (+ salud pension arl))
         )
        (make-pago
         nominal
         salud
         pension
         arl
         (+ nominal  (* 0.6 total_aportes))
         (- nominal  (* 0.4 total_aportes))
         )
        )
      (calcular-nomina (rest lemp))
      )
     ]
    )
  )

(check-expect (calcular-nomina (list (make-ejecutivo 1000000 21) (make-operativo 5600 30)))

(list (make-pago 1200000 60000 76800 24000 1296480 1135680)
      (make-pago 168000 8400 10752 3360 181507.2 158995.2))
)