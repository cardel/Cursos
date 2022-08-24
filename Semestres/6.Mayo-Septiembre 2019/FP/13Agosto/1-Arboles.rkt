;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 1-Arboles) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct arbol (valor hizq hder))

(define arbolA (make-arbol 5
                           (make-arbol 2 '() '())
                           (make-arbol 7
                                       (make-arbol 9 '() '())
                                       (make-arbol 11
                                                   (make-arbol 12 '() '()) '()))))



(define arbolB (make-arbol 25
                           (make-arbol 4 '() '())
                           (make-arbol 49
                                       (make-arbol 81 '() '())
                                       (make-arbol 121
                                                   (make-arbol 144 '() '()) '()))))

;;COntrato: elevar-arbol: arbol -> arbol
;;Propósito: Elevar los elementos de un árbol al cuadrado
(define (elevar-arbol arb)
  (cond
    [(empty? arb) empty]
    [else
     (make-arbol
      (sqr (arbol-valor arb))
      (elevar-arbol (arbol-hizq arb))
      (elevar-arbol (arbol-hder arb))
      )
     ]
  )
  )