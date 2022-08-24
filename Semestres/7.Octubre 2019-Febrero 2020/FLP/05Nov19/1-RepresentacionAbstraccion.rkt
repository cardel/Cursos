#lang eopl

;;Interfaz del tipo de dato números naturales
(define is-zero?
  (lambda (n)
    (= n 0)))

(define sucesor
  (lambda (n)
    (+ n 1)))

(define predecesor
  (lambda (n)
    (if (is-zero? n) (eopl:error "No existe predecesor de 0")
        (- n 1))))


;;Area del programador

(define sumar-a-todo-gas
  (lambda (a b)
    (cond
      [(is-zero? b) a]
      [(sucesor (sumar-a-todo-gas a (predecesor b)))])))

(define restar-a-todo-gas
  (lambda (a b)
    (cond
      [(is-zero? b) a]
      [(is-zero? a) (eopl:error "vea no puedo ser negativo")]
      [else (predecesor (restar-a-todo-gas a (predecesor b)))])))


;;Multiplicar

(define multiplicar-a-todo-gas
  (lambda (a b)
    (cond
      [(is-zero? b) b]
      [else (sumar-a-todo-gas a (multiplicar-a-todo-gas a (predecesor b))
                              )])))


;;a^b

(define elevar-pro
  (lambda (a b)
    (cond
      [(is-zero? b) (sucesor b)]
      [else (multiplicar-a-todo-gas a (elevar-pro a (predecesor b)))])))