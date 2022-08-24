#lang eopl

(define a 5)
(define b (list 1 2 3 4))
(define c #t)
(define d "hola")

(+ 5 9)

(* (+ 5 2) (* 2 3)) ; ( (5+2)*(2*3))

(display (+ (* 5 (+ 2 3)) (- 2 (* 4 (sqrt 3))))) ; 5*(2+3) + (2 - (4 * sqrt(3)))

(define (funcion x y)
                 (+ x y))

(define (funcion2 z)
  (+ 2 z))


(define funcion3
  (lambda (x y) (* x y)))

(define funcion4
  (lambda (a b c)
    (if
     (> a b)
     a
     c)))

;; (if <pregunta> <respuesta_t> <respuesta_f>)

(define agente_discoteca
  (lambda (edad)
    (cond
      [(and (>= edad 0) (< edad 18)) "No puedes entrar"]
      [(and (>= edad 18) (<= edad 30)) "Vaya a la sección jóvenes"]
      [(and (> edad 30) (< edad 50)) "Vaya a la sección adultos"]
      [(>= edad 50) "Vaya a la viejoteca"]
      [else (string-append "Edad no válida " (number->string edad))  ]
      )))

(display "\n")(display  (agente_discoteca 14))
(display "\n")
(display (agente_discoteca 19))(display "\n")
(display (agente_discoteca 35))(display "\n")
(display (agente_discoteca 55))(display "\n")
(display (agente_discoteca -3))

;;Funciones como ciudadanos de primera clase

(define operacion
  (lambda (a b f)
    (f a b)))

(display "\n")
(display (operacion 4 5 (lambda (x y) (expt x y))))
(display "\n")
(display (operacion 1 2 (lambda (z w) (> z w))))
(display "\n")


(define funcionMisterio
  (lambda (a b f)
    (cond      
      [(f a) "F es cierto en a"]
      [(f b) "F es cierto en b"]
      [else "F nunca es cierto"])))

(display "\n")
(display (funcionMisterio 4 3 (lambda (x) (> x 5))))
(display "\n")
(display (funcionMisterio 6 7 (lambda (x) (> x 5))))


(define a2 (lambda (x y) (+ x y)))
(define b2 (lambda (a b) (* a b)))
(define c2 (lambda (p o r) (r p o)))
(define d2 (lambda (a b) (lambda (c d) (+ a b c d))))
(display "\n")
(display (a2 2 3))  (display "\n")
(display (b2 2 3))   (display "\n") 
(display (c2 4 3 a2))  (display "\n")
(display (c2 8 9 (lambda (m n) (expt m n))))  (display "\n")
(display (d2 1 2))  (display "\n")
(display ((d2 1 2) 1 3))  (display "\n")

;Listas

(cons 1 (cons 2 (cons 3 empty)))
(list 1 2 3)

(list 'a 'b 'c)

'(a b c)

(define l1 '(1 2 (a b) (1 2 3) (2 3 2)))
(define l2 (list 1 2 (list 'a 'b) (list 1 2 3) (list 2 3 2)))

(car l1)
(cdr l1)

(define arbol1 '(k (p () ()) (u (w () ()) ())))


(define l3 '(1 2 3 4 5))

(define sumar-lista
  (lambda (lst)
    (cond
      [(null? lst) 0]
      [else
       (+ (car lst) (sumar-lista (cdr lst)))])))