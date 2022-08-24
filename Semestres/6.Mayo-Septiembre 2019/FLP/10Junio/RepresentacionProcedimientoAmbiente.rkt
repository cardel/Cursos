#lang eopl

;;Autor: Carlos A Delgado
;;Fecha: 10 de Junio de 2019

(define empty-env
  (lambda ()
    (lambda (search-var)
      (eopl:error "No me encontraste, busca en tu tinieble")
      )
    )
  )

(define extend-env
  (lambda (var val env-e)
    (lambda (search-var)
      (if (equal? search-var var) val
          (apply-env search-var env-e)
          )
      )
    )
  )

(define apply-env
  (lambda (search-var env)
    (env search-var)))

;;Area del programador

(define e
  (extend-env 'd 6
              (extend-env 'y 8
                      (extend-env 'x 7
                                  (extend-env 'y 14
                                              (empty-env)
                                              )))))