;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 3-ListasListas3) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp")) #f)))


(define listaP (list "hola" (list "baba" "cosa") (list (list "zapato") "oso")))

;;Nos piden el string mayor de una lista de listas, varios enfoques
;;Transformar la lista de listas en una lista y luego sacar el mayor

;;Transformar la lista de listas en una lista

;;Autor: Carlos A Delgado
;;Fecha: 15 de Marzo de 2021
;;Contrato: transformar-lista: lista de listas de string -> lista de string
;;Descripción: Esta función transforma una lista de listas en una sola lista
;;Ejemplos
;;(list "hola" (list "baba" "cosa") (list (list "zapato") "oso")) -> (list "hola" "baba" "cosa" "zapato" "oso")
(define (transformar-lista lsst)
  (cond
    [(empty? lsst) '()]
    [(cons? (first lsst))
     (append
      (transformar-lista (first lsst))
      (transformar-lista (rest lsst)))]
    [else
     (cons
      (first lsst)
      (transformar-lista (rest lsst))
      )]))

(transformar-lista listaP)


;;Ordenar

;;insert: string, lista de strings -> lista de strings
(define (insert str lst)
  (cond
    [(empty? lst) (list str)]
    [(string>? str (first lst)) (cons str lst)]
    [else
     (cons
      (first lst)
      (insert str (rest lst)))]))

;;ordenar: lista de string -> lista de string
;;Descripción: Retorna la lista de string ordenada de mayor a menor
(define (ordenar lst)
  (cond
    [(empty? lst) empty]
    [else (insert (first lst) (ordenar (rest lst)))]))


(ordenar (transformar-lista listaP))

;;obtener-mayor: lista de string -> string
;;descripción: esta función me retorna el string mayor

(define (obtener-mayor lst)
  (first (ordenar (transformar-lista lst))))


(obtener-mayor listaP)
