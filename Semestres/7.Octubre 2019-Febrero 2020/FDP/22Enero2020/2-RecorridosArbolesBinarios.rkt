;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2-RecorridosArbolesBinarios) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
(define-struct arbol (valor hizq hder))

(define arbolA
  (make-arbol 5
              (make-arbol 9
                          (make-arbol 1
                                      (make-arbol 3 '() '())
                                      (make-arbol 7 '() '())
                                      )
                          (make-arbol 8 '() '()))
              (make-arbol 7
                          (make-arbol 11 '() '())
                          (make-arbol 13
                                      (make-arbol 18 '() '())
                                      (make-arbol 26 '() '()))))
  )
;;Autor: Carlos A Delgado
;;Fecha: 22 de Enero de 2020
;;Contrato: recorrido-preorden: arbol -> lista de numeros

(define (recorrido-preorden arb)
  (cond
    [(empty? arb) '()]
    [else (append
           (cons (arbol-valor arb) '())
           (recorrido-preorden (arbol-hizq arb))
           (recorrido-preorden (arbol-hder arb)))]))


;(recorrido-preorden arbolA)

;;Autor: Carlos A Delgado
;;Fecha: 22 de Enero de 2020
;;Contrato: recorrido-inorden:  arbol -> lista de numeros
(define (recorrido-inorden arb)
  (cond
    [(empty? arb) '()]
    [else (append
           (recorrido-inorden (arbol-hizq arb))
           (cons (arbol-valor arb) '())
           (recorrido-inorden (arbol-hder arb)))]))

;(recorrido-inorden arbolA)


;;Autor: Carlos A Delgado
;;Fecha: 22 de Enero de 2020
;;Contrato: recorrido-posorden: arbol -> lista de numeros
(define (recorrido-posorden arb)
  (cond
    [(empty? arb) '()]
    [else
     (append
      (recorrido-posorden (arbol-hizq arb))
      (recorrido-posorden (arbol-hder arb))
      (cons (arbol-valor arb) '()))]))

(recorrido-posorden arbolA)