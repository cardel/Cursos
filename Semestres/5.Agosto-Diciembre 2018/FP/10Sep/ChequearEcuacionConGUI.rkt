;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ChequearEcuacionConGUI) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "guess.rkt" "teachpack" "htdp")) #f)))
; Autor:  Docente curso Fundamentos de programación
;; Fecha de creación: 11-Agosto-2018
;; Contrato: chequear-numeros numero,numero -> simbolo
;; Propósito: Esta función recibe dos números y retorna un simbolo de acuerdo a su diferencia
;; Ejemplo: (chequear-numeros 1 1) -> 'Perfecto ;;Iguales
;; Ejemplo: (chequear-numeros 1 4000) -> 'Pequeña  ;:Diferencia menor a 10000
;; Ejemplo: (chequear-numeros 1 10002) -> 'Grande  ;; Diferencia mayor a 10000
;; Definición
(define (chequear-numeros a b)
  (cond
    [ (= a b) 'Perfecto]
    [ (and (> (abs (- a b)) 0) (<= (abs (- a b)) 10000)) 'Pequeña]
    [else 'Grande]
    )
  )

;Pruebas
(check-expect (chequear-numeros 1 1) 'Perfecto)
(check-expect (chequear-numeros 1 4000) 'Pequeña)
(check-expect (chequear-numeros 1 10002) 'Grande)


;Ejercicio
(guess-with-gui chequear-numeros)
