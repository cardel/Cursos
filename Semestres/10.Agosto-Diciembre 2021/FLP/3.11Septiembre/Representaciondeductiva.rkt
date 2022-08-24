#lang eopl

;;Especificación de los números pares
(define in-S2?
  (lambda (x)
    (cond
      [(= x 2) #T]
      [(> x 2) (in-S2? (- x 2))]
      [else #F])))

;;Especificación de listas de pares S1

(define in-S1?
  (lambda (l)
    (cond
      [(null? l) #T]
      [(and
        (in-S1? (cdr l))
        (in-S2? (car l))
        ) #T]
      [else #F]
      )))

(define listaA '(2 4 10 12 18 22))
(define listaB '(4 10 12 11 12 22 18))

(display (in-S1? listaA))
(display "\n")
(display (in-S1? listaB))

;;Conjunto s3

(define in-S3?
  (lambda (t)
    (cond
      [(equal? t '(0 1)) #T]
      [(and
        (>= (car t) 0)
        (>= (cadr t) 1))
       (in-S3? (list (- (car t) 1)
                     (- (cadr t) 7)))]
      [else #f])))
(display "\n")
(display "Punto 1 diapositivas\n")
(display (in-S3? '(3 22)))
(display "\n")
(display (in-S3? '(3 23)))
(display "\n")

;;Ejemplo 2, la función in-S4?

(define in-S4?
  (lambda (l)
    (cond
      [(equal? l '(0 1))]
      [(and
        (>= (car l) 0)
        (>= (cadr l) 1))
       (in-S4? (list
                (- (car l) 1)
                (/ (cadr l) 2)))]
      [else #f])))

(display "Punto 2 diapositivas\n")
(display (in-S4? '(8 256)))
(display "\n")
(display (in-S4? '(10 1023)))
(display "\n")
