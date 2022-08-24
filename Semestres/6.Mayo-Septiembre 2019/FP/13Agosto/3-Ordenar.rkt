;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname 3-Ordenar) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;(require racket/base)

(define-struct amigo (nombre edad color))

;;Lista de amigos y quiere ordenamos por nombre

(define listaAmigos
  (cons (make-amigo 'juan 23 'negro)
        (cons (make-amigo 'natalia 19 'amarilla)
              (cons (make-amigo 'carlos 26 'blanco)
                    empty))))

;;Contrato: ordenar: lista de amigos -> lista de amigos
(define (ordenar lst)
  (cond
    [(empty? lst) empty]
    [else
     (insertar (first lst) (ordenar (rest lst)))]
    )
  )
;;Contrato: inserta amigo, lista de amigos -> lista de amigos
(define (insertar n lst)
  (cond
    [(empty? lst) (cons n empty)]
    [(string<? (symbol->string (amigo-nombre n)) (symbol->string(amigo-nombre (first lst)))) (cons n lst)]
    [else
     (cons (first lst) (insertar n (rest lst)))]))

(ordenar listaAmigos)