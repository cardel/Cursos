;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname 8-AbstraccionDeTipos) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;;Abstracción de tipos


;;filtro: lista de numeros, (numero, numero -> booleano) -> lista de numeros

(define (filtro lst f dato)
  (cond
    [(empty? lst) empty]
    [(f (first lst) dato) (cons (first lst) (filtro (rest lst) f dato))]
    [else (filtro (rest lst) f dato)]
    ))



(filtro (list 1 2 3 4 5) > 2)
(filtro (list 1 2 3 4 5) < 2)
(filtro (list 1 2 3 4 5) = 2)
(filtro (list 1 2 3 4 5) <= 4)
(filtro (list 1 2 3 4 5) >= 3)

;;otros ejemplos

(define (mayor-o-igual-2-par num)
  (and (even? num) (>= num 2)))

(define (mayor-o-igual-2-impar num)
  (and (odd? num) (>= num 2)))

;;Abstracción funcional
(define (comparar-f num f g)
  (and (f num) (g num 2)))

;Abstracción de tipos (datos)

;;comparar-generico: numero, (numero->booleano), (numero, numero-> booleano), numero -> booleano
(define (comparar-generico num f g dato)
  (and (f num) (g num dato)))