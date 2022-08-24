#lang eopl

;;Definición inductiva
;;Listas
;; '() pertence a S
; l pertenece a S y n es una número natural (n l) pertenece a S
(define in-S?
  (lambda (l)
    (cond
      [(null? l) #T]
      [else  (and (number? (car l))
                           (in-S? (cdr l)))])))

(in-S? '(1 2 3 4 5))

;;Número pares (positivos)
;; 2 pertecene a S
;; Si n pertenece a S entonces n+2 pertenece a S

(define in-Spar?
  (lambda (n)
    (cond
      [(= n 2) #T]
      [(< n 2) #F]
      [else (in-Spar? (- n 2))]
      )))

(in-Spar? 5)



