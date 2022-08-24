;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname 1-EjemploLocales) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))
(define-struct libro (codigo nombre lmaterias))

;;Autor: Carlos A Delgado
;;Fecha: 17 de Febrero de 2020
;;COntrato: buscar-libro: lista de libros, (libro -> booleano) -> lista de libros

(define (buscar-libro llibros f)
  (cond
    [(empty? llibros) empty]
    [else
     (local
       (
        (define resto (buscar-libro (rest llibros) f))
        )
       (cond
         [(f (first llibros))  (cons (first llibros) resto)]
         [else resto]
         )
       )
     ]
    )
  )

;;Buscar por codigo

(define lista-libros
  (list
   (make-libro 472 "La odisea de Diego"
               (list "Ciencia ficción" "Frustracción"
                     "Drama" "Terror" "Desgano"))
   (make-libro 420 "Diego el acosador"
               (list "Feminismo" "Machismo" "Ejercicios para manos"
                     "Drama" "Terror" "Pasión"))
   (make-libro 923 "Diego alcohol"
               (list "Drama" "Recursividad" "Violencia"
                     "Creatividad" "Soledad"))
   (make-libro 872 "El otro diego"
               (list "Hermoso" "Contrariedad" "Frustracción"
                     "Personalidad"))
   (make-libro 332 "Monster Inc"
               (list "Boo" "Machismo" "Secuestro" "Terror"
                     "Traición" "Hermoso"))))

;;Definir los llamados

(buscar-libro lista-libros
              (lambda (x) (equal? (libro-codigo x) 872)))

(buscar-libro lista-libros
              (lambda (x) (equal? (libro-nombre x) "Monster Inc")))


"Busqueda por materia"

(buscar-libro lista-libros
              (lambda (x)
                (local
                  (
                   (define (buscar-elemento lista elm)
                     (cond
                       [(empty? lista) #F]
                       [(equal? (first lista) elm) #T]
                       [else (buscar-elemento (rest lista) elm)]))
                   )
                  (buscar-elemento (libro-lmaterias x) "Terror")
                  )
                )
              )