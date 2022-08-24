#lang eopl

;;;; Ambientes - Representación como listas ;;;;;;;;;;;;;;;;;;;;

;; empty-env
(define empty-env
  (lambda () (list 'empty-env)))

;; extend-env
(define extend-env
  (lambda (var val env)
    (list 'extend-env var val env)))

;; apply-env
(define apply-env
  (lambda (env search-var)
    (cond ((eqv? (car env) 'empty-env)
           (eopl:error 'apply-env "No binding for ~s" search-var))
          ((eqv? (car env) 'extend-env)
           (let ((saved-var (cadr env))
                 (saved-val (caddr env))
                 (saved-env (cadddr env)))
             (if (eqv? search-var saved-var)
                 saved-val
                 (apply-env saved-env search-var))))
          (else (eopl:error 'apply-env "Expecting an environment, given ~s" env)))))

;; Ejemplos
(define e
  (extend-env 'd 6
              (extend-env 'y 8
                          (extend-env 'x 7
                                      (extend-env 'y 14
                                                  (empty-env))))))

;(apply-env e 'd)
;(apply-env e 'y)
;(apply-env e 'c)