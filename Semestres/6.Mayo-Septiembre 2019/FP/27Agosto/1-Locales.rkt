;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 1-Locales) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;Contrato f: lista de numeros -> lista de numeros
;;Proposito: Recibir una lista y retornar la lista con cada uno de los elementos (a) lo siguiente
;;Suponga que a es par, entonces a = (a^2+2)/(a^3+3)
;;Si a es impar a =  (a^2+2)/(a^3+4)
;;EJemplo (f (list 1 2 3)) - 

(define (f lista)
  (cond
    [(empty? lista) empty]
    [else
     (local
       ;;Definición
       (
        (define a  (+ (sqr (first lista)) 2))
        (define b (expt (first lista) 3))
        (define c (f (rest lista)))
        (define (funcion a b num c)
          (cons (/ a (+ b num) ) c))
        )
       ;;Uso
       (cond
         [(even? (first lista)) (funcion a b 3 c)]
         [else
          (funcion a b 4 c)])
         )
     ]

       )
     )
     
 

(f (list 1 2 3))

