;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname 5-filtro) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (f a b) (+ a b))

;;Ejercicio lambda
;;Función que recibe a,b y c numeros
;;Si a > b retorna a+b
;;Si b > c retorna a-c
;;En otro caso retorna a+b+c

(define f2 (lambda (a b c)
  (cond
    [(> a b) (+ a b)]
    [(> b c) (- a c)]
    [else (+ a b c)])))

;;Filtro exquisito

(define filtro-exquisito
  (lambda (lis fun)
    (cond
      [(empty? lis) empty]
      [else
       (local
         (
          (define resto (filtro-exquisito (rest lis) fun))
          )
         (cond
           [(fun (first lis)) (cons (first lis) resto)]
           [else resto]
           )
         )
       ]
      )
    )
  )

(filtro-exquisito (list 1 2 3 4) (lambda (x) (and (odd? x) (> x 2))))
(filtro-exquisito (list 1 2 3 4 5) (lambda (x) (and (even? x) (< x 4))))

;;Filtro sabroso


(define filtro-sabrosongo
  (lambda (lis fun num)
    (cond
      [(empty? lis) empty]
      [else
       (local
         (
          (define resto (filtro-sabrosongo (rest lis) fun num))
          )
         (cond
           [(fun (first lis) num) (cons (first lis) resto)]
           [else resto]
           )
         )
       ]
      )
    )
  )



(filtro-sabrosongo (list 1 2 3 4 5) (lambda (x num) (> x num)) 5)
(filtro-sabrosongo (list 1 2 3 4 5) (lambda (x num) (<= x num)) 5)