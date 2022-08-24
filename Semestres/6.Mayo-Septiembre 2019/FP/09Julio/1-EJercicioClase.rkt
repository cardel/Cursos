;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 1-EJercicioClase) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
(define-struct producto (codigo tipo))
(define-struct tipo (nombre categoria))

(define lista
  (cons (make-producto 1 (make-tipo 'pollo 'carne))
        (cons (make-producto 2 (make-tipo 'uva 'fruta))
              (cons (make-producto 3 (make-tipo 'manzana 'fruta))
                    (cons (make-producto 4 (make-tipo 'costilla 'carne))
                          (cons (make-producto 5 (make-tipo 'pera 'fruta))
                                empty))))))
;;Autor: Carlos A Delgado
;;Fecha: 9 de Julio de 2019
;;generar-lista-categoria: lista de productos -> lista de simbolos
;;Proposito: Obtenerun una de lista de categorias de una lista de productos
(define (generar-lista-categoria lisprod)
    (cons (tipo-categoria (producto-tipo (first lisprod)))
          (cons (tipo-categoria (producto-tipo (first (rest lisprod))))
                (cons (tipo-categoria (producto-tipo (first (rest (rest lisprod)))))
                      (cons (tipo-categoria (producto-tipo (first (rest (rest (rest lisprod))))))
                            (cons (tipo-categoria (producto-tipo (first (rest (rest (rest (rest lisprod)))))))
                                  empty)
                            )
                      )
                )
          )
  )
  
;;Esta función si llamamos (generar-lista-categoria lista) ->
;;(cons 'carne (cons 'fruta (cons 'fruta (cons 'carne (cons 'fruta empty)))
(generar-lista-categoria lista)