#lang eopl
;;Procedimientos contructores
(define empty-env
  (lambda ()
    (lambda (signal var)
      (cond
        [(= signal 0) 'empty-env]
        [(= signal 1) (eopl:error "No se encuentra el identificador" var)]
        [else (eopl:error "Señal no válida")]
        ))))

(define extend-env
  (lambda (var value old-env)
    (lambda (signal fvar)
      (cond
        [(= signal 0) 'extend-env]
        [(= signal 1)
         (if (equal? var fvar)
             value
             (old-env 1 var))]
        [(= signal 2) var]
        [(= signal 3) value]
        [(= signal 4) old-env]))))

;;Procedimientos observadores

;;Predicados
(define empty-env?
  (lambda (env)
    (equal? (env 0 empty) 'empty-env)))

(define extend-env?
  (lambda (env)
    (equal? (env 0 empty) 'extend-env)))

;;Extractores
(define extend-env->id
  (lambda (e)
    (e 2 empty)))

(define extend-env->value
  (lambda (e)
    (e 3 empty)))

(define extend-env->old-env
  (lambda (e)
    (e 4 empty)))



;;Area de programación

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