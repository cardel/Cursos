;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4-Ordenamiento) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;Contrato: insertar: lista de numeros, numero -> lista de numeros
;;Ejempls (insertar (cons 1 (cons 2 (cons 4 empty)) 3
 ;; (cons 1 (cons 2 (cons 3 (cons 4 empty))))
;;(insertar (cons 2 (cons 4 (cons 8 empty))) 12)
;;(cons 2 (cons 4 (cons 8 (cons 12 empty))))

(define (insertar lnum num)
    (cond
         [(empty? lnum) (cons num empty)]
         [(< num (first lnum)) (cons num lnum)]
         [else (cons (first lnum) (insertar (rest lnum) num))]
         )
  )

;(insertar (cons 1 (cons 2 (cons 4 empty))) 3)
 ;; (cons 1 (cons 2 (cons 3 (cons 4 empty))))
;(insertar (cons 2 (cons 4 (cons 8 empty))) 12)
;;(cons 2 (cons 4 (cons 8 (cons 12 empty))))

;;Ordenar: lista de numeros -> lista de numeros
(define (ordenar lnum)
  (cond
    [(empty? lnum) '()]
    [else
     (insertar (ordenar (rest lnum)) (first lnum))]))

(ordenar (cons 9 (cons 3 (cons 5 (cons 6 (cons 10 (cons 2 empty)))))))