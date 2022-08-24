#lang eopl

;;;; Ambientes - Representación como procedimientos ;;;;;;;;;;;;;;;;;;;;

;; empty-env
(define empty-env
  (lambda ()
    (lambda (search-var)
      (eopl:error 'apply-env "No binding for ~s" search-var))))

;; extend-env
(define extend-env
  (lambda (saved-var saved-val saved-env)
    (lambda (search-var)
      (if (eqv? search-var saved-var)
          saved-val
          (apply-env saved-env search-var)))))

;; apply-env
(define apply-env
  (lambda (env search-var)
    (env search-var)))

;; Ejemplos
(define e
  (extend-env 'd 6
              (extend-env 'y 8
                          (extend-env 'x 7
                                      (extend-env 'y 14
                                                  (empty-env))))))

(apply-env e 'd)
;(apply-env e 'y)
;(apply-env e 'c)