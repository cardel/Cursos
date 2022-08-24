;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname estRecursivas) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
(define-struct matrioshka
  (color-ojos color-vestido matrioshkaInterna))

(define mun1
  (make-matrioshka 'verde 'azul
                   (make-matrioshka 'negro 'rosado
                                    (make-matrioshka 'rojo 'lila empty))))

;;Quiero hacer una función que me devuelva verdadero si existe una muñeca que tenga un color ojos que ingresar

;;Autor: Carlos Delgado
;;Fecha: 4 de Marzo de 2019
;;Contrato: buscar-matrioshka-ojos: matrioshka, simbolo -> booleano

(define (buscar-matrioshka-ojos ma colorOj)
  (cond
    [(empty? ma) #F]
    [(symbol=? (matrioshka-color-ojos ma) colorOj) #T]
    [else (buscar-matrioshka-ojos (matrioshka-matrioshkaInterna ma) colorOj)]
    )
  )

(buscar-matrioshka-ojos mun1 'rojo)
(buscar-matrioshka-ojos mun1 'rosado)


;;Ejemplo de clase
(define-struct child
   (father mother age name eye)
)

(define carl (make-child empty empty 1926 'carl 'green))
(define bettina (make-child empty empty 1926 'bettina 'green))
(define adam (make-child carl bettina 1950 'adam 'yellow))
(define dave (make-child carl bettina 1955 'dave 'black))
(define eva (make-child carl bettina 1965 'eva 'blue))

(define fred (make-child empty empty 1966 'fred 'pink))
(define gustav (make-child fred eva 1988 'gustav 'brown))

