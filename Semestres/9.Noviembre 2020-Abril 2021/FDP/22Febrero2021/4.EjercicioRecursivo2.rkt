;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4.EjercicioRecursivo2) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
;;Autor: Carlos A Delgado
;;Fecha 22 de Feb de 2021
;;Contrato: sumar-lista: lista de numeros -> numero
;;Descripción: Esta función toma los elementos de una lista y los suma
;;Ejemplo
;;(cons 2 (cons 3 (cons 4 (cons 5 (cons 6 empty)))) 20
;;(cons 3 (cons 6 (cons 9 empty))) 18
;;empty   0
(define (sumar-lista lst)
  (cond
    [(empty? lst) 0]
    [else
     (+
      (first lst)
      (sumar-lista (rest lst))
      )]))

(check-expect (sumar-lista (cons 2 (cons 3 (cons 4 (cons 5 (cons 6 empty)))))) 20)
(check-expect (sumar-lista (cons 3 (cons 6 (cons 9 empty)))) 18)
(check-expect (sumar-lista empty) 0)


;;¿Como hariamos para sumar el doble de los elementos de la lista?
;;Ejemplo
;;(cons 2 (cons 3 (cons 4 (cons 5 (cons 6 empty)))) 4+6+8+10+12 = 40
;;(cons 3 (cons 6 (cons 9 empty))) 6+12+18=36

;;¿Como hariamos para sumar únicamente los que son pares?. even?

;;Autor: Carlos A Delgado
;;Fecha: 22 de Feb de 2021
;;Contrato: sumar-doble: lista de numeros -> numero
;;Propósito: Calcular la suma del doble de los elementos de una lista
;;Ejemplos
;;(cons 2 (cons 3 (cons 4 (cons 5 (cons 6 empty)))) 4+6+8+10+12 = 40
;;(cons 3 (cons 6 (cons 9 empty))) 6+12+18=36
(define (sumar-doble lst)
  (cond
    [(empty? lst) 0]
    [else
     (+
      (* 2 (first lst))
      (sumar-doble (rest lst))
      )
     ]
    ))

(check-expect (sumar-doble (cons 2 (cons 3 (cons 4 (cons 5 (cons 6 empty)))))) 40)
(check-expect (sumar-doble (cons 3 (cons 6 (cons 9 empty)))) 36)

;;¿Como hariamos para sumar únicamente los que son pares?. even?

;;Autor: Carlos A Delgado
;;Fecha: 22 de Feb de 2021
;;Contrato: sumar-pares: lista de numeros -> numero
;;Ejemplos
;;(cons 2 (cons 3 (cons 4 (cons 5 (cons 6 empty)))) 2+4+6 = 12
;;(cons 3 (cons 6 (cons 9 empty))) 6
(define (sumar-pares lst)
  (cond
    [(empty? lst) 0]
    [(even? (first lst))
     (+
      (first lst)
      (sumar-pares (rest lst)))]
    [else
     (sumar-pares  (rest lst))]
    ))
(check-expect (sumar-pares (cons 2 (cons 3 (cons 4 (cons 5 (cons 6 empty)))))) 12)
(check-expect (sumar-pares (cons 3 (cons 6 (cons 9 empty)))) 6)