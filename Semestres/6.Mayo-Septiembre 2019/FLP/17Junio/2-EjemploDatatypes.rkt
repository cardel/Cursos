#lang eopl

;; 'x
;; '(lambda (x) y)
;; '(x (lambda (x) y))

(define-datatype expression expression?
  (var-exp (id symbol?))
  (lambda-exp (id symbol?)
              (body expression?))
  (app-exp (rator expression?)
           (rand expression?)))

(define parse
  (lambda (expP)
    (cond
      [(symbol? expP) (var-exp expP)]
      [(equal? (car expP) 'lambda)
       (lambda-exp (caadr expP) (parse (caddr expP)))]
      [else (app-exp
             (parse (car expP))
             (parse (cadr expP)))
            ]
      )
    ))

(define unparse
  (lambda (exp)
    (cases expression exp
      (var-exp (id) id)
      (lambda-exp (id body)
                  (list 'lambda (list id) (unparse body)))
      (app-exp (rator rand)
       (list
        (unparse rator)
        (unparse rand))))))