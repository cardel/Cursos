;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname 2-MergeSort) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;Autor: Carlos A Delgado
;;Fecha: 03 de Septiembre

(define (particion lst f)
  (local
    (
     (define (particion-aux lista acc f)
       (cond
         [(empty? lista) empty]
         [(f acc (ceiling (/ (length lst) 2)))
          (cons (first lista) (particion-aux (rest lista) (+ acc 1) f))]
         [else (particion-aux (rest lista) (+ acc 1) f)]
         )
       )
     )
    (particion-aux lst 1 f)
    )
  )

;;pegar: lista denumeros, lista de numeros -> lista de numeros

(define (pegar l1 l2)
  (cond
    [(and (empty? l1) (empty? l2)) empty]
    [(empty? l1) l2]
    [(empty? l2) l1]
    ((< (first l1) (first l2))
     (cons (first l1) (pegar (rest l1) l2)))
    [else
     (cons (first l2) (pegar l1 (rest l2)))]))

;;;custom-mergesort: Lista de numeros -> lista de numeros
(define (custom-mergesort lst)
  (cond
    [(empty? lst) empty]
    [(empty? (rest lst)) lst]
    [else
      (pegar
       (custom-mergesort (particion lst <=))
       (custom-mergesort (particion lst >))
       )
      ]
    )
  )

;;(custom-mergesort (list 8 15 1 3 4 2 5 0 -3 -100 2.9 e))
(custom-mergesort (list 4 5 1 2))


(define (nth lst pos)
  (cond
    [(empty? lst) (error "No tengo seis elementos")]
    [else
     (local
       (
        (define
          (nth-aux lista acc)
             (cond
               [(empty? lista) (error (string-append "No tengo " (number->string pos) " elementos"))]
               [(= acc pos) (first lista)]
               [else (nth-aux (rest lista) (+ acc 1))]
               )
          )
        )
       (nth-aux lst 1)
       )
     ]
    )
  )