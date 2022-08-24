;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 4EstructurasRecursivas) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
(define-struct child (name mother father yearOfBorn jailYears))

(define carl (make-child 'carl empty empty 1926 30))

(define bettina (make-child 'bettina empty empty 1927 15))
(define pastrana (make-child 'pastrana empty empty 1970 8))

(define ricardo (make-child 'ricardo bettina pastrana 1960 10))
(define alvparac (make-child 'alvarapac empty carl 1970 200))

(define duque (make-child 'duque alvparac ricardo 2017 100))

(define (sumar-jailYears child)
  (cond
    [(empty? child) 0]
    [else
     (+
      (child-jailYears child)
      (sumar-jailYears (child-mother child))
      (sumar-jailYears (child-father child))
      )
     ]
    )
  )
