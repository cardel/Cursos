;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 3-EjerciciosRecursion) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
;;Autor: Carlos A Delgado
;;Fecha: 22 de Febrero de 2021
;;Contrato: buscar-numero: numero, lista de numero -> booleano
;;Propósito: Indicar si un número está en una lista
;;Ejemplos
;;listaA = (cons 1 (cons 2 (cons 3 (cons 4 (cons 5 (cons 6 empty))))))
;;elemento = 4 retornar #true
;;elemento = -5 retorna #false
(define (buscar-numero num lst)
  (cond
    [(empty? lst) #false]
    [(= (first lst) num) #true]
    [else (buscar-numero num (rest lst))]
    ))

(define listaA (cons 1 (cons 2 (cons 3 (cons 4 (cons 5 (cons 6 empty)))))))
(check-expect (buscar-numero 4 listaA) #t)
(check-expect (buscar-numero -5 listaA) #f)

;;buscar-persona-nombre

(define-struct persona (nombre edad cargo))

(define listaPersonas
  (cons (make-persona "Juan" 18 "Gerente")
        (cons (make-persona "Diana" 22 "Administradora")
              (cons (make-persona "Pedro" 35 "Oficial")
                    (cons (make-persona "María" 20 "Operadora")
                          (cons (make-persona "Carlos" 12 "Vendedor") empty))))))

;;Autor: Carlos A Delgado
;;Fecha: 22 de Feb de 2021
;;Contrato: buscar-persona-nombre: lista de personas, string -> booleano
;;Propósito: Esta función indica si en una lista de personas, hay al menos una persona con un nombre dado
;;Ejemplo
;;listaPersonas
;;nombre= Pedro  #true
;;nomber= Abelardo #falso
(define (buscar-persona-nombre lst nom)
  (cond
    [(empty? lst) #f]
    [(string=? (persona-nombre (first lst)) nom) #t]
    [else (buscar-persona-nombre (rest lst) nom)]
    )
  )

(check-expect (buscar-persona-nombre listaPersonas "Pedro") #true)
(check-expect (buscar-persona-nombre listaPersonas "Abelardo") #false)