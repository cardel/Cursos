;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 3-AbstraccionFuncional) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; funcion: (numero -> bool), numero -> bool

(define (funcion f num)
  (f num))

;;mayorque5: numero -> bool
(define (mayorque5 num)
  (> num 5))

(define (igualque5 num)
  (= num 5))

(define (menorque5 num)
  (< num 5))