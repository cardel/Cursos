;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ejemplosAcumuladores) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
 (require lang/htdp-advanced)

;;Función invierte una lista

;;invertir: lista de numeros -> lista de numeros
(define (invertir lst)
  (cond
    ;¿Que pasa si quiere invertir una lista vacia, R/ ella misma
    [(empty? lst) '()]
    [else
     (local
       (
        (define (convertir-en-ultimo n lstnum)
          (cond
            [(null? lstnum) (list n)]
            [else (cons (first lstnum) (convertir-en-ultimo n (rest lstnum)))]
            )
          )
        )
       (convertir-en-ultimo (first lst) (invertir (rest lst)))
       )]))

(check-expect (invertir (list 1 2 3 4 5 6 7)) (list 7 6 5 4 3 2 1))


;;Sumar una lista
;;sumar-lista: lista de numeros -> numero
(define (sumar-lista lst)
  (cond
    [(null? lst) 0]
    [else
     (local
       (
        (define (suma-acc lstnum acc)
          (cond
            [(empty? lstnum) acc]
            [else (suma-acc (rest lstnum) (+ acc (first lstnum)))]
            )
          )
        )
       (suma-acc lst 0)
       )
     ]
    ))

;;Mayor lista
;;mayor-lista: lista de numeros -> numero
(define (mayor-lista lst)
  (cond
    [(null? lst) (error "No se puede obtener el mayor de una lista vacía")]
    [else
     (local
       (
        (define (mayor-lista-acc lstnum acc)
          (cond
            [(null? lstnum) acc]
            [(> (first lstnum) acc) (mayor-lista-acc (rest lstnum) (first lstnum))]
            [else (mayor-lista-acc (rest lstnum) acc)]
            ))
        )
       (mayor-lista-acc lst (first lst))
       )]))

(check-expect (mayor-lista (list 1 2 3 4 5 6 7)) 7)
(check-expect (mayor-lista (list -2 -3 -4 -5 -6 -7 -1 -100)) -1)
            