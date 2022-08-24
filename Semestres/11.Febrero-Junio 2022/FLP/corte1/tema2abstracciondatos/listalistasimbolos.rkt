#lang eopl
(define listaS?
  (lambda (l)
    (cond
      [(null? l) #T]
      [(list? l)
       (and
        (symbol? (car l))
        (listaS? (cdr l)))]
      [else #F])))

(define listaSS?
  (lambda (l)
    (cond
      [(null? l) #T]
      [(list? l)
       (and
        (listaS? (car l))
        (listaSS? (cdr l)))]
      [else #F])))
  

(display (listaSS? '( ( w s a a q q ew r) ( a s s ds ds ))))
(display (listaSS? '( (q w e r t) s (s a s b s f))))
