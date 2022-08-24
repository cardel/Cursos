;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 5-EjercicioListas) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;;Autor: Carlos A Delgado
;;Fecha: 02 de Julio de 2019

;;Contrato: buscar-mayor: lista-numeros -> numero
;;Descripción: Esta función recibe una lista de 5 números y retorna el mayor

(define lista1 (cons 2 (cons 3 (cons 8 (cons 1 (cons -3 empty))))))
;;Ejemplos (buscar-mayor lista1) -> 8
;;(buscar-mayor (cons 20 (cons 18 (cons 55 (cons 67 (cons 666 empty)))))) -> 666

(define (buscar-mayor lst)
  (cond
    [(and (> (first lst) (first (rest lst)))
          (> (first lst) (first (rest (rest lst))))
          (> (first lst) (first (rest (rest (rest lst)))))
          (> (first lst) (first (rest (rest (rest (rest lst))))))
          )
     (first lst)]
    [(and
      (> (first (rest lst)) (first (rest (rest lst))))
      (> (first (rest lst)) (first (rest (rest (rest lst)))))
      (> (first (rest lst)) (first (rest (rest (rest (rest lst))))))
      )
     (first (rest lst))]
    [(and
      (> (first (rest (rest lst))) (first (rest (rest (rest lst)))))
      (> (first (rest (rest lst))) (first (rest (rest (rest (rest lst))))))
      )
     (first (rest (rest lst)))]
     [(> (first (rest (rest (rest lst)))) (first (rest (rest (rest (rest lst))))))

      (first (rest (rest (rest lst))))
      ]
     [else
      (first (rest (rest (rest (rest lst)))))]
     )
  )


(check-expect (buscar-mayor lista1)  8)
(check-expect (buscar-mayor (cons 20 (cons 18 (cons 55 (cons 67 (cons 666 empty)))))) 666)



;;buscar-simbolo: lista-simbolos -> booleano
(define lista-simboloB (cons 'papa (cons 'carro (cons 'avion (cons 'estufa (cons 'techo empty))))))

;;Descripción: Esta función indica si un simbolo está en una lista

(define (buscar-simbolo lst sim)
  (cond
    [(symbol=? (first lst) sim) true]
    [(symbol=? (first (rest lst)) sim) true]
    [(symbol=? (first (rest (rest lst))) sim) true]
    [(symbol=? (first (rest (rest (rest lst)))) sim) true]
    [(symbol=? (first (rest (rest (rest (rest lst))))) sim) true]
    [else false]
    )
  )

(check-expect (buscar-simbolo lista-simboloB 'avion) true)
(check-expect (buscar-simbolo lista-simboloB 'casa) false)

