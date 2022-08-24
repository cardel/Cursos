;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname RecorridosArbol2) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;;Ejemplo de arbol de operaciones
(define-struct arbol (valor hizq hder))

(define arbolOperaciones
  (make-arbol "/"
              (make-arbol "+"
                          (make-arbol 5 empty empty)
                          (make-arbol 3 empty empty))
              (make-arbol "+"
                          (make-arbol "x" empty empty)
                          (make-arbol 8 empty empty))))


;;Autor: Carlos A Delgado
;;Fecha: 22 de Agosto de 2020
;;Contrato: arbol -> lista de numeros
(define (recorrido-preorden arb)
  (cond
    [(null? arb) '()]
    [else
      (append
       (cons "(" empty)
       (cons (arbol-valor arb) empty)
       (recorrido-preorden (arbol-hizq arb))
       (recorrido-preorden (arbol-hder arb))
       (cons ")" empty))
     ]
    ))

(recorrido-preorden arbolOperaciones)
;;Autor: Carlos A Delgado
;;Fecha: 22 de Agosto de 2020
;;Contrato: arbol -> lista de numeros
(define (recorrido-inorden arb)
  (cond
    [(null? arb) '()]
    [else
      (append
       (cons "(" empty)
       (recorrido-inorden  (arbol-hizq arb))
       (cons (arbol-valor arb) empty)
       (recorrido-inorden  (arbol-hder arb))
       (cons ")" empty))

     ]
    ))
(recorrido-inorden arbolOperaciones)


;;Autor: Carlos A Delgado
;;Fecha: 22 de Agosto de 2020
;;Contrato: arbol -> lista de numeros
(define (recorrido-posorden arb)
  (cond
    [(null? arb) '()]
    [else
      (append
       (cons "(" empty)
       (recorrido-posorden  (arbol-hizq arb))
       (recorrido-posorden  (arbol-hder arb))
       (cons (arbol-valor arb) empty)
       (cons ")" empty)
       )
     ]
    ))
(recorrido-posorden arbolOperaciones)