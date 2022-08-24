;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname 4-Begin) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))

(define (generar-lista-1-n n)
  (local
    (
     (define (aux-genera n acc)
       (cond
         [(= n 0) empty]
         [(= acc n) (cons acc empty)]
         [else
          (begin
            (display (string-append " numero: " (number->string acc)))
            (cons acc (aux-genera n (+ acc 1)))
            )
          ])
       )
     )
    (aux-genera n 1)
    )
  )


(define variable 2)
(set! variable 4)
(display variable)

