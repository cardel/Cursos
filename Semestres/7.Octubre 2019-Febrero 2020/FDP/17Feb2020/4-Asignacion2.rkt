;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname 4-Asignacion2) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))

(define listaA (list 1 2 3 4))

;;CambiarElemento lista de numeros, numero -> lista de numeros

(define (CambiarElemento lst num pos)
  (cond
    [(empty? lst) (error "La posicion no existe")]
    [else
     (local
       (
        (define (cambiarElementoAux lst num pos acc)
          (cond
            [(empty? lst) (error "La posicion no existe")]
            [(= pos acc) (cons num (rest lst))]
            [else
             (cons (first lst) (cambiarElementoAux (rest lst) num pos (+ acc 1)))]
            )
          )
        )
       (cambiarElementoAux lst num pos 0)
        )
     ]
    )
  )
listaA
(set! listaA (CambiarElemento listaA 6 3))
  listaA