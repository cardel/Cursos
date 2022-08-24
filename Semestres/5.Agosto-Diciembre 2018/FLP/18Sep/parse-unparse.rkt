#lang eopl

(define-datatype lc-exp lc-exp?
  (var-exp (id symbol?))
  (lambda-exp (id symbol?)
              (body lc-exp?))
  (app-exp (rator lc-exp?)
           (rand lc-exp?)))

(define unparse-exp
  (lambda (exp)
    (cases lc-exp exp
      (var-exp (id) id)
      (lambda-exp (id body)
                  (list 'lambda id (unparse-exp body)))
      (app-exp (rator rand)
       (list
        (unparse-exp rator)
        (unparse-exp rand))))))


(define parse-expresion
  (lambda (dato)
    (cond
      [(symbol? dato) (var-exp dato)]
      [(eqv? (car dato) 'lambda)
       (lambda-exp (cadr dato)
                   (parse-expresion (caddr dato)))]
      [else (app-exp
             (parse-expresion (car dato))
              (parse-expresion (cadr dato)))]
      )
    )
  )



  
(define exp1 (lambda-exp 'x  (app-exp
                 (var-exp 'f)
                 (app-exp (var-exp 'f) (var-exp 'x))
                          )
                 )
  )
(unparse-exp exp1)

(parse-expresion '(lambda x (f (f x))))

 (parse-expresion '( (lambda x (lambda y (f x))) (lambda f (f x))))
