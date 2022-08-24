#lang eopl

(define nth-element
  (lambda (l n)
    (cond
      [(null? l) '()]
      [(= n 1) (car l)]
      [else (nth-element (cdr l) (- n 1))])))

(define remove-first
  (lambda (l)
    (cond
      [(null? l) '()]
      [else (cdr l)])))


(define remove-nth
  (lambda (l n)
    (cond
      [(null? l) '()]
      [(= n 1) (cdr l)]
      [else (cons (car l) (remove-nth (cdr l) (- n 1)))])))