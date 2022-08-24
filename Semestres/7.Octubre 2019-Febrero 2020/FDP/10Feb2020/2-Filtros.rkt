;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 2-Filtros) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;;Autor:Carlos A DElgado
;;Fecha: 10 de Febrero 2020
;;Contrato: mayores-que-5: lista-numeros -> lista-numeros
(define (mayores-que-5 lst)
  (cond
    [(empty? lst) '()]
    [(> (first lst) 5)
     (cons (first lst) (mayores-que-5 (rest lst)))]
    [else (mayores-que-5 (rest lst))])
  )


(mayores-que-5 (list 1 2 3 4 5 6 7 8 9 10 11 12 13))


(define (menores-que-5 lst)
  (cond
    [(empty? lst) '()]
    [(< (first lst) 5)
     (cons (first lst) (menores-que-5 (rest lst)))]
    [else (menores-que-5 (rest lst))])
  )
(menores-que-5 (list 1 2 3 4 5 6 7 8 9 10 11 12 13))

;;Abstracción


(define (comparar-5 lst f)
  (cond
    [(empty? lst) '()]
    [(f (first lst) 5)
     (cons (first lst) (comparar-5 (rest lst) f))]
    [else (comparar-5 (rest lst) f)])
  )


(comparar-5 (list 1 2 3 4 5 6 7 8 9 10 11 12 13) >)
(comparar-5 (list 1 2 3 4 5 6 7 8 9 10 11 12 13) <)
(comparar-5 (list 1 2 3 4 5 6 7 8 9 10 11 12 13) =)


(define (comparar-generico lst f x)
  (cond
    [(empty? lst) '()]
    [(f (first lst) x)
     (cons (first lst) (comparar-generico (rest lst) f x))]
    [else (comparar-generico (rest lst) f x)])
  )


(comparar-generico (list 1 2 3 4 5 6 7 8 9 10 11 12 13) > 6)
(comparar-generico (list 1 2 3 4 5 6 7 8 9 10 11 12 13) < 9) 
(comparar-generico (list 1 2 3 4 5 6 7 8 9 10 11 12 13) = 12)

(comparar-generico (list 1 2 3 4 5 6 7 8 9 10 11 12 13) >= 4)