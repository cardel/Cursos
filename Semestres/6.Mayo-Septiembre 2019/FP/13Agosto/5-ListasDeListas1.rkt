;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 5-ListasDeListas1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define lista (cons (cons 1 (cons 2 (cons 3 empty)))
                    
                    (cons 2 (cons (cons 3 (cons 4 (cons 5 empty))) empty))))

;;sumar-listas: lista de numeros -> numero
(define (sumar-listas lst)
  (cond
    [(empty? lst) 0]
    [(list? (first lst)) (+ (sumar-listas (first lst)) (sumar-listas (rest lst)))]
    [else (+ (first lst) (sumar-listas (rest lst)))]
    )
  )