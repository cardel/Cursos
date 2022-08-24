#lang eopl

(define generarListaFactoriales
  (lambda (n)
    (letrec
        (
         (factorial (lambda (n) (if (= n 0) 1 (* n (factorial (- n 1))))))
         (generarLista (lambda (n cnt)
                         (cond
                           [(> cnt n) '()]
                           [else (cons (factorial cnt) (generarLista n (+ cnt 1)))]
                           )
                         )
                       )
         )
      (generarLista n 0)
      )
    )
  )

(display (generarListaFactoriales 10))
(display "\n")
(display (generarListaFactoriales 20))