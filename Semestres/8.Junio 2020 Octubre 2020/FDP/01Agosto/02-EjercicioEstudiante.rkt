;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname 02-EjercicioEstudiante) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "guess.rkt" "teachpack" "htdp")) #f)))

#|
;;Autor: Jordi Santiago Ledesma Arboleda
;;Fecha: 31 de Julio del 2020
;;Propósito: Esta función permite visualizar el salario total,
el descuento por salud, el descuento por pensión, descuento por ARP y
el salario devengado
;;Contrato: calcular-salario-robusto estructura -> estrucura
;;Ejemplos:
 (calcular-salario-robusto profesor1 ) salarioRobusto
|#
;;Contrato: salarioRobusto
(define (calcular-salario-robusto profesor)
  (cond
    [(profesor-por-horas? profesor) (calcular-salario-robusto-total (salarioProfesor-por-horas profesor))]
    [(profesor-voluntario? profesor) (calcular-salario-robusto-total (salarioProfesor-voluntario profesor))]
    [(profesor-de-planta? profesor) (calcular-salario-robusto-total (salarioProfesor-de-planta profesor))]
    [else (error "Error en el tipo de profesor")]
    )
  )
;;Contrato: calcular-salario-robusto-total número -> número
(define (calcular-salario-robusto-total salarioTotal)
  (make-salarioRobusto salarioTotal (* salarioTotal 0.05) (* salarioTotal 0.064)(* salarioTotal 0.02) (* salarioTotal 0.866))
  )
;;Definiciones de funciones
(define-struct profesor-por-horas (valorHora horasTrabajadas))
(define-struct profesor-voluntario (salarioBase apoyoTransporte))
(define-struct profesor-de-planta (salarioBase apoyoTransporte gastosRepresentacion))
(define-struct salarioRobusto (salarioTotal descuentoSalud descuentoPension descuentoARP devengado))
;;Intancias de los profesores
(define profesoraPaola (make-profesor-por-horas 0 36))
(define profesorCasallas (make-profesor-voluntario 35000000 4500000))
(define profesorArango (make-profesor-de-planta 4000000 500000 2500000))
(define profesorManuel (make-profesor-de-planta 78000000 6500000 1500000))
(define profesorDiego (make-profesor-por-horas 68000 8))
;;Espacio:
(define espacio "-------------------------------------------------------------")
;;Punto
(define carita "(^.^)")
;;Separar: seperar texto -> texto
(define (separar x)
  (cond
    [(equal? x carita) carita]
    [(equal? x espacio) espacio]
    )
  )

;;Contato: salarioProfesor-por-horas estrucutura -> número
(define (salarioProfesor-por-horas profesor)
  (* (profesor-por-horas-valorHora profesor) (profesor-por-horas-horasTrabajadas profesor))
  )
;;Contrato: salarioProfesor-voluntario estructura -> número
(define (salarioProfesor-voluntario profesor)
  (+ (profesor-voluntario-salarioBase profesor) (profesor-voluntario-apoyoTransporte profesor))
  )
;;Contrato: salarioProfesor-de-planta estructura -> número
(define (salarioProfesor-de-planta profesor)
  (+
   (profesor-de-planta-salarioBase profesor)
   (profesor-de-planta-apoyoTransporte profesor)
   (profesor-de-planta-gastosRepresentacion profesor)
     )
  )
(display "monstrando datos de la profesora Paola: ")
(separar carita)
;;Muestra de datos de la profesora Poala
(display "SalarioTotal: ")
(salarioRobusto-salarioTotal (calcular-salario-robusto profesoraPaola))
(display "Descuento por salud :")
(salarioRobusto-descuentoSalud (calcular-salario-robusto profesoraPaola))
(display "Descuento por pension :")
(salarioRobusto-descuentoPension (calcular-salario-robusto profesoraPaola))
(display "Descuento por ARP :")
(salarioRobusto-descuentoARP (calcular-salario-robusto profesoraPaola))
(display "Devengado :")
(salarioRobusto-devengado (calcular-salario-robusto profesoraPaola))
(separar espacio)

(display "monstrando datos del profesor Casallas 2: ")
(separar carita)
;;Muestra de datos del profesor Casallas
(display "SalarioTotal: ")
(salarioRobusto-salarioTotal (calcular-salario-robusto profesorCasallas))
(display "Descuento por salud :")
(salarioRobusto-descuentoSalud (calcular-salario-robusto profesorCasallas))
(display "Descuento por pension :")
(salarioRobusto-descuentoPension (calcular-salario-robusto profesorCasallas))
(display "Descuento por ARP :")
(salarioRobusto-descuentoARP (calcular-salario-robusto profesorCasallas))
(display "Devengado :")
(salarioRobusto-devengado (calcular-salario-robusto profesorCasallas))
(separar espacio)

(display "monstrando datos del profesor Arango 3: ")
;;Muestra de datos del profesor Arango
(separar carita)
(display "SalarioTotal: ")
(salarioRobusto-salarioTotal (calcular-salario-robusto profesorArango))
(display "Descuento por salud :")
(salarioRobusto-descuentoSalud (calcular-salario-robusto profesorArango))
(display "Descuento por pension :")
(salarioRobusto-descuentoPension (calcular-salario-robusto profesorArango))
(display "Descuento por ARP :")
(salarioRobusto-descuentoARP (calcular-salario-robusto profesorArango))
(display "Devengado :")
(salarioRobusto-devengado (calcular-salario-robusto profesorArango))
(separar espacio)
