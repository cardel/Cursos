;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 2-FiltrosAmigos) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;;Diseñar un filtro que reciba una lista de amigos

(define-struct amigo (nombre edad estatura))

;;Filtra edad > >= = < <=

(define (filtrar-amigo lst f edad)
  (cond
    [(empty? lst) '()]
    [else
     (local
       (
        (define resto (filtrar-amigo (rest lst) f edad))
        )
       (cond
         [(f (amigo-edad (first lst)) edad) (cons (first lst) resto)]
         [else  resto]
         )
       )
     ]
    )
  )

(define listaA
  (list
   (make-amigo 'arturo 9 20)
   (make-amigo 'julian 8 200)
   (make-amigo 'edwin 20 30)
   (make-amigo 'juana 19 180)
   )
  )

(filtrar-amigo listaA > 15)
(filtrar-amigo listaA < 10)
(filtrar-amigo listaA >= 20)