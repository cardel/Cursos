;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname 3-Asignacionr) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))
(define variableA 5)


(define (aumentarValorA x)
  (begin
    (set! variableA (+ variableA x))
    "El cambio se ha hecho exitosamente"
    )
  )

(define (disminuirValorA x)
  (begin
    (set! variableA (- variableA x))
    "El cambio se ha hecho correctamente"
    )
  )


(define ecuacion 13)

(define (calcular-ecuacion)
  (begin
    (set! ecuacion (+ ecuacion 2))
    (set! ecuacion (sqr ecuacion))
    (set! ecuacion (/ ecuacion 2))
    (set! ecuacion (sqrt ecuacion))
    "Cambios realizado con éxito"
    )
  )