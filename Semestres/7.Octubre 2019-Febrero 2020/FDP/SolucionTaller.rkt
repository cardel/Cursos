;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname SolucionTaller) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
(define-struct info-hotel (nombre numNoches costoNoche infoHabitacion))
(define-struct info-habitacion (numCamas numBaños numDuchas))

(define-struct info-transporte (ciudadOrigen ciudadDestino valorTiquete numPersonas otros))
(define-struct otros-viaje-info (aeropuerto niños-ancianos))

(define-struct info-guia (ciudad nombrePlan numSitios valorSitio))

(define-struct info-plan (valorHotel valorTransporte valorPlanGuia valorTotal))

;;Autor: Carlos A Delgado
;;Fecha 07 de dic 2019
;;Contrato: calcular-hotel: info-hotel -> numero
(define (calcular-hotel info-h)
  (* (info-hotel-costoNoche info-h) (info-hotel-numNoches info-h)
     (if (or (> (info-habitacion-numCamas (info-hotel-infoHabitacion info-h)) 2)
             (> (info-habitacion-numBaños (info-hotel-infoHabitacion info-h)) 3)
             (> (info-habitacion-numDuchas (info-hotel-infoHabitacion info-h)) 2))
         1.25
         1
         )
     )
  )

;;Autor: Carlos A Delgado
;;Fecha: 07 de Dic 2019
;;Contrato: calcular-costo-transporte: info-transporte -> numero
(define (calcular-costo-transporte info-t)
  (*
   (+
    (* (info-transporte-valorTiquete info-t) (info-transporte-numPersonas info-t))
    (otros-viaje-info-aeropuerto (info-transporte-otros info-t))
    (otros-viaje-info-niños-ancianos (info-transporte-otros info-t))
    )
   (if
    (> (info-transporte-numPersonas info-t) 5)
    0.6
    1
    )
   )
  )

;;Autor: Carlos A Delgado
;;Fecha: 07 de Dic de 2019
;;Contrato: calcular-valor-guia: info-guia -> numero
(define (calcular-valor-guia info-g)
  (* 
   (info-guia-numSitios info-g) 
   (info-guia-valorSitio info-g)
   (if (> (info-guia-numSitios info-g) 4) 1.2 1)
   )
 )


;;Autor: Carlos A Delgado
;;Fecha: 07 de Dic 2019
;;Contrato: calcular-valor-plan: info-hotel, info-transporte, info-guia -> info-plan
;;Propósito: Es presentar en una estructura el costo total de un viaje turistico
;;Ejemplos.
(define (calcular-valor-plan info-h info-t info-g)
  (make-info-plan
   (calcular-hotel info-h)
   (calcular-costo-transporte info-t)
   (calcular-valor-guia info-g)
   (+ (calcular-hotel info-h) (calcular-costo-transporte info-t) (calcular-valor-guia info-g))
   ))
 
;;Pruebas

(define hotel
  (make-info-hotel
   "Tulua city"
   2
   20000
   (make-info-habitacion 2 4 5)))

(define transporte
  (make-info-transporte
   "Cali"
   "Cartagena"
   120000
   6
   (make-otros-viaje-info 4000 6000)))


(define guia
  (make-info-guia
   "Cartagena"
   "Plan FDP"
   5
   40000
   ))

(calcular-valor-plan hotel transporte guia)


;;Autor: Carlos A Delgado
;;Fecha: 07 de Diciembre de 2019
;;Contrato: desplegar-informacion: info-plan, string -> string
;;Propósito: Emitir una información comprensible para un usuario (persona)
;;(define-struct info-plan (valorHotel valorTransporte valorPlanGuia valorTotal))
;;Ejemplos
;
(define (desplegar-informacion plan nombre)
  (string-append
   "Señor "
   nombre
   " su plan tiene un costo total de "
   (number->string (info-plan-valorTotal plan))
   ", en total son "
   (number->string (info-plan-valorHotel plan))
   ", en transporte son "
   (number->string (info-plan-valorTransporte plan))
   " y su plan de visita "
   (number->string (info-plan-valorPlanGuia plan))
   ", gracias por cree en nosotros :)"
   )
  )

(desplegar-informacion (calcular-valor-plan hotel transporte guia) "Carlos")