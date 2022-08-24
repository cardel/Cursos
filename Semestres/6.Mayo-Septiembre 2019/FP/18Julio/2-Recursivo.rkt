;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2-Recursivo) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;Autor: Carlos A Delgado
;; Fecha: 18 de Jul de 2019
;;Contrato: multiplicacion: numero, numero ->numero
(define (multiplicacion a b)
    (cond
      [(= b 1) a]
      [(= b 0) 0]
      [else (+ a (multiplicacion a (- b 1)))]

      )
)

;(check-expect (multiplicacion 2 3) 6)
;(check-expect (multiplicacion 9 8) 72)
;;;Contrato: elevar: numero, numero -> numero
(define (elevar a b)
   (cond
     [(= b 1) a]
     [(= b 0) 1]
     [else (* a (elevar a (- b 1)))]
     )
  )


(check-expect (elevar 2 3) 8)
(check-expect (elevar 9 8) 43046721)