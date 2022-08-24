;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2 OperadoresLogicos|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(equal? (string-length "abc") (string-length "cda"))

(string=? "hola" "Hola")

(symbol=? 'a 'b)

(equal? "hola" 3)

(equal~? 1.9 2 0.1)

;;Operadores logicos

(and true true true true true true false)
(or false false false false false true false)
(or false false false)


(not (= 3 4))

'hola-mundo
'hola.mundo
'hola_mundo
'holaMundo
