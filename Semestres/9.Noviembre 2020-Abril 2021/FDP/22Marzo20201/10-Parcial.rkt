;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname 10-Parcial) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp")) #f)))

;;Punto 2
;;Estructuras para codificar la información


;;Estas estructuras se requieren para la codificación de la información
(define-struct persona (datos total))

(define-struct datos-persona (cedula nombre apellido))

;;Punto 3 : Cargar Datos

;;Autor: Carlos A Delgado
;;Fecha: 22 de Marzo de 2021
;;Contrato: string -> lista de personas
(define (cargar-datos ubicacion)
  (local
    (
     (define lsst (read-words/line ubicacion) )
     )
    (transformar-estructura lsst)
    ))

;;Contrato: transformar-estructura: lista de listas de string -> lista de personas

(define (transformar-estructura lsst)
  (cond
    [(empty? lsst) empty]
    [else
     (cons
      (make-persona
       (make-datos-persona
        (first (first lsst)) ;Cedula
        (first (rest (first lsst)))  ;Nombre
        (first (rest (rest (first lsst))))  ;Apellido      
        )
       (string->number (first (rest (rest (rest (first lsst)))))) ;Total que gana (número) (cast)
       )
      (transformar-estructura (rest lsst))
      )
     ]
    )
  )


(define lista-personas (cargar-datos "datosPersonas.txt"))

;;Punto 4

;;filtro: lista de personas, (persona->booleano) -> lista de personas
(define (filtro lst f)
  (cond
    [(empty? lst) lst]
    [else
     (local
       (
        (define primero (first lst))
        (define resto (filtro (rest lst) f))
        )
       (cond
         [(f (first lst)) (cons primero resto)]
         [else resto]
         ))
     ]
    )
  )
(display "Filtro por personas que ganan más de 300000\n")
(filtro lista-personas (lambda (x) (> (persona-total x) 300000)))
(display "Filtro por personas que ganan menos de 200000\n")
(filtro lista-personas (lambda (x) (< (persona-total x) 200000)))
;;buscar-nombre: string, lista de strings -> booleano
(define (buscar-nombre nombre lista)
  (cond
    [(empty? lista) #false]
    [(equal? (first lista) nombre) #true]
    [else (buscar-nombre nombre (rest lista))]
    ))

(display "Filtro por personas de una lista\n")
(filtro lista-personas (lambda (x) (buscar-nombre (datos-persona-nombre (persona-datos x)) (list "Maria" "Juan" "Alberto" "Carlos" "Edgar"))))

(filtro lista-personas (lambda (x) (buscar-nombre (datos-persona-nombre (persona-datos x)) (list "Royer" "Carlos"))))

;;Punto 5: Ordenamiento

;;insert: persona, lista de personas, (persona,personas->booleano) -> lista de personas
;;Esta función recibe una persona, una lista de personas ordenada retornando una lista de persona ordenada
(define (insert lst per f)
  (cond
    [(empty? lst) (list per)]
    [(f per (first lst)) (cons per lst)]
    [else (cons (first lst) (insert (rest lst) per f))]
    ))

;;ordenamiento: lista de personas, (persona, persona->booleano) -> lista de personas
(define (ordenamiento lst f)
  (cond
    [(empty? lst) lst]
    [else (insert (ordenamiento (rest lst) f) (first lst) f)]
    ))

;;Ordenar por nombre
(display "Ordenar por nombre\n")
(ordenamiento lista-personas (lambda (x y) (not (string>? (datos-persona-nombre (persona-datos x)) 
                                                          (datos-persona-nombre (persona-datos y))))))


(display "Ordenar por apellido\n")
(ordenamiento lista-personas (lambda (x y) (not (string>? (datos-persona-apellido (persona-datos x)) 
                                                          (datos-persona-apellido (persona-datos y))))))


(display "Ordenar por salario\n")
(ordenamiento lista-personas (lambda (x y) (< (persona-total x) 
                                              (persona-total y))))
