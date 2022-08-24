#lang eopl
(define empty-env
  (lambda () (list 'empty-env)))

(define extend-env
  (lambda (id value old-env)
    (list 'extend-env id value old-env)))

(define empty-env?
  (lambda (e)
    (equal? (car e) 'empty-env)))

(define extend-env?
  (lambda (e)
    (equal? (car e) 'extend-env)))

(define extend-env->id
  (lambda (e)
    (cadr e)))

(define extend-env->value
  (lambda (e)
    (caddr e)))

(define extend-env->old-env
  (lambda (e)
    (cadddr e)))

;;Area del programador
(define e
  (extend-env 'd 6
              (extend-env 'y 8
                          (extend-env 'x 7
                                      (extend-env 'y 14
                                                  (empty-env))))))
                                              
(define apply-env
  (lambda (e var)
    (cond
      [(empty-env? e) (eopl:error "La variable" var "no ha sido encontrada")]
      [(extend-env? e)
       (if (equal? (extend-env->id e) var)
           (extend-env->value e)
           (apply-env (extend-env->old-env e) var))]
      [else (eopl:error "Estructura no válida")]
      )))

(display (apply-env e 'x))
(display "\n")
(display (apply-env e 'y))
