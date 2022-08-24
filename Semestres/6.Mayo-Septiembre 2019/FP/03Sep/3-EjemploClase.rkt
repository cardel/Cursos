;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname 3-EjemploClase) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define-struct amigo (nombre edad))

(define listaAmigos (list
                     (make-amigo 'Juan 18)
                     (make-amigo 'Pedro 10)
                     (make-amigo 'Ana 11)
                     (make-amigo 'Beatriz 28)))

(list 'Ana 'Beatriz 'Juan 'Pedro)

(define (obtener-lista-nombres lst)
  (cond
    [(empty? lst) empty]
    [else (cons (amigo-nombre (first lst)) (obtener-lista-nombres (rest lst)))]))

(define (filtro lst f)
  (cond
    [(empty? lst) empty]
    [(f (first lst)) (cons (first lst)
                           (filtro (rest lst) f))]
    [else
     (filtro (rest lst) f)]))

(display "salida\n")
(filtro (obtener-lista-nombres listaAmigos) (lambda (x) (string<? (string-downcase (symbol->string x)) "c") ))