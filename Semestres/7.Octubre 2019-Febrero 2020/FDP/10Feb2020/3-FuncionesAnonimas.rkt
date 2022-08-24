;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname 3-FuncionesAnonimas) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))

(lambda (x) (+ x 2))

(define (f x) (+ x 2))

( (lambda (x) (+ x 2) ) 3)
(f 3)
(define-struct amigo (nombre edad estatura))

;;Contrato: filtrar-amigo: lista de amigos, (amigo->booleano) -> lista de amigos
(define (filtrar-amigo lst f)
  (cond
    [(empty? lst) '()]
    [else
     (local
       (
        (define resto (filtrar-amigo (rest lst) f))
        )
       (cond
         [(f (first lst)) (cons (first lst) resto)]
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
   (make-amigo 'j 12 150)
   
   )
  )

(filtrar-amigo listaA (lambda (x) (> (amigo-edad x) 15)))
(filtrar-amigo listaA (lambda (x) (> (amigo-estatura x) 40)))
(filtrar-amigo listaA (lambda (x) (eqv? (amigo-nombre x) 'julian)))
(filtrar-amigo listaA (lambda (x) (string>? (symbol->string (amigo-nombre x)) "j")))
;(filtrar-amigo listaA < 10)
;(filtrar-amigo listaA >= 20)
