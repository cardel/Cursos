;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname 4-AbstraccionFuncional) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;Diseñar un filtro para listas de listas de numeros
;;filtro: lista de lista de numeros, numero->bool -> lista de numeros

(define (filtro lis f)
  (cond
    [(empty? lis) empty]
    [(list? (first lis))
     (cons (filtro (first lis) f)
             (filtro (rest lis) f))]
    [(f (first lis)) (cons (first lis) (filtro (rest lis) f))]
    [else (filtro (rest lis) f)]
    )
  )

(filtro (list (list 1 2) (list 1 2 3 4) 1 2 3 4 5) odd?)



;;FIltro de productos

(define-struct producto (nombre valor))

(define listaprod
  (list
   (make-producto 'panela 10000)
   (make-producto 'guarapo 12000)
   (make-producto 'chunchulo 20000)
   (make-producto 'carnedecaballo 1000)
   (make-producto 'chorizoSantander 1000)
   )
  )

;;Filtro: lista de productos, numero, (numero, producto -> bool), (numero,numero->bool) -> lista de productos
(define (filtro-productos lispro num f g)
  (cond
    [(empty? lispro) empty]
    [else
     (local
       (
        (define resto  (filtro-productos (rest lispro) num f g))
        )
       (cond
         [(f (first lispro) num g) (cons (first lispro)
                                         resto
                                         )]
         [else resto]
         
         )
       
       )
    ])
  )


(define (filtro-producto pro num g)
  (g  (producto-valor pro) num))









