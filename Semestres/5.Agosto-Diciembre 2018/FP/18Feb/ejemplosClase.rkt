;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ejemplosClase) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;;Autor: Carlos A Delgado
;;Fecha: 18 de Feb 2019
;;COntrato: factorial: numero -> numero
;;Ejemplos (factorial 5) -> 120, (factorial 4) -> 24
(define (factorial num)
  (cond
    [(= num 0) 1]
    [else
     (* num (factorial (- num 1)))]))

;(factorial 5)

;;Autor: Carlos Delgado
;;Fecha: 18 de Feb 2019
;;Contrato: sumaLista: lista de numero -> numero
;;Ejemplos (sumaLista (cons 1 (cons 2 (cons 3 '())))) -> 6
(define (sumaLista l)
  (cond
    [(empty? l) 0]
    [else (+ (first l)
             (sumaLista (rest l))
             )
          ]
    )
  )
;;(sumaLista (cons 1 (cons 2 (cons 3 '()))))


;;Autor: Carlos Delgado
;;Fecha: 18 de Feb 2019
;;Contrato: listaDoble: lista de numeros ->lista de numeros
;;Propósito: A partir de una lista d enumeros generar una lista cuyos elementos son el doble de la primera
;;Ejemplos: (listaDoble (list 1 2 3)) -> (list 2 4 6)
(define (listaDoble l)
  (cond
    [(null? l) '()]
    [else
     (cons
      (* 2 (first l))
      (listaDoble (rest l)))
     ]
    )
  )
;(listaDoble (list 1 2 3))


;;Autor: Carlos Delgado
;;Fecha: 18 de Feb 2019
;;Contrato: generarLista: numero -> lista de numeros
;;Proposito: A partir de un numero dado generar una lista desde n hasta ese numero
;;Pruebas (generarLista 5) -> (cons 5 (cons 4 (cons 3 (cons 2 (cons 1 empty)))))
(define (generarLista n)
  (cond
    [(= n 1) (cons 1 empty)]
    [else (cons n (generarLista (- n 1)))]
  )
)

(generarLista 5)


;;Solución punto 3 preparcial

(define-struct principal (salario oficina titulo))
(define-struct teacher (salario hab titulo))
(define-struct asistente (salarioH numH))

;;Autor: Carlos Delgado
;;Fecha: 18 de Feb
;;Contrato: calcularImpuesto : empleado, numero -> numero
;;Proposito: Calcular el impuesto que paga un empleado
;;ejemplo
;; (calcularImpuesto (make-principal 1000 'a1 'phd) 20) -> 200
;; (calcularImpuesto (make-teacher 3000 'p4 'msc) 15) -> 450
;; (calcularImpuesto (make-asistente 5000 100) 25) -> 125000
(define (calcularImpuesto empleado impuesto)
  (cond
    [(principal? empleado) (/ (*(principal-salario empleado) impuesto) 100)]
    [(teacher? empleado) (/ (*(teacher-salario empleado) impuesto) 100)]
    [(asistente? empleado) (/ (* (asistente-salarioH empleado) (asistente-numH empleado) impuesto) 100)]
    [else "Debe ingresar estructura empleado"]
    )
  )

;;Pruebas

(check-expect (calcularImpuesto (make-principal 1000 'a1 'phd) 20) 200)
(check-expect (calcularImpuesto (make-teacher 3000 'p4 'msc) 15) 450)
(check-expect (calcularImpuesto (make-asistente 5000 100) 25)  125000)


;;Punto de estudiantes

(define-struct estudiante (nombre notaAlgebra notaEspa notaSoc))

(define lista1
  (list
   (make-estudiante 'Carlos 0 3.9 2.5)
   (make-estudiante 'Diego 2.9 3.5 1.0)
   (make-estudiante 'Robinson 0 2.5 5.0)
   )
  )

;;Autor: Carlos A Delgado
;;Fecha: 18 de Feb 2019
;;Contrato: obtener-promedio: lista de estudiantes, simbolo -> numero
;;Proposito: Obtener el promedio de un estudiante que está en una lista
;;Pruebas
;; (obtener-promedio lista1 'Carlos) -> 2.13)
;; (obtener-promedio lista1 'Pedro) -> -1)

(define (obtenerPromedioEstudiante es)
  (/
   (+ (estudiante-notaAlgebra es)
      (estudiante-notaEspa es)
      (estudiante-notaSoc es))
   3)
  )


(define (obtener-promedio LE nombre)
  (cond
    [(empty? LE) -1]
    [(symbol=? (estudiante-nombre (first LE)) nombre) (obtenerPromedioEstudiante (first LE))]
    [else
     (obtener-promedio (rest LE) nombre)
     ]
    )
  )

(obtener-promedio lista1 'Carlos)
(obtener-promedio lista1 'Pedro) 



;;Agregar un elemento a una lista
;;Contrato: agregarLista: lista-simbolos, simbolo  -> listasimbolos
(define (agregarAlPrincipio l s)
  (cons s l))

(agregarAlPrincipio (list 'a 'b 'c) 'pedro )

(define (agregarAlFinal l s)
  (cond
    [(empty? l) (cons s l)]
    [else
     (cons (first l) (agregarAlFinal (rest l) s))
     ]
    )
  )

(agregarAlFinal (list 'a 'b 'c) 'pedro )

      