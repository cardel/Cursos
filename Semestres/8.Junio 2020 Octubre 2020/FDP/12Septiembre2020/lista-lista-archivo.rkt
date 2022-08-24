;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname lista-lista-archivo) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
;;lista-a-string-aux: lista de string -> string
(define (lista-a-string-aux lst)
  (cond
    [(null? lst) ""]
    [else (string-append (first lst) " " (lista-a-string-aux (rest lst)))]))

;;lista-a-string: lista de lista de string -> string
(define (lista-a-string lsst)
  (cond
    [(null? lsst) ""] 
    [else (string-append (lista-a-string-aux (first lsst)) "\n" (lista-a-string (rest lsst)))]))

(define (escribir-ejemplo lsst)
  (write-file "datos/ejemploClase.txt" (lista-a-string lsst)))

;;Rutas absolutas: C:/Users/Usuario/Documentos/hola.txt   /home/usuario
;;Rutas relativas: datos/hola.txt <-- USEN ESTO
;;Ruta relativa: "hola.txt" el archivo hola.txt está en el mismo directorio que el archivo Dr Racket
;;Ruta relativa: "/datos/data1/archivo.txt" el archivo.txt está dentro de un directorio data1 dentro de un director datos ubicado donde esta el archivo Dr Racket.

;(escribir-ejemplo (list (list "hola" "hola" "hola") (list "ha" "ha" "ha") (list "a" "a" "b")))