;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 3-RecorridosArbolesMArios) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
(define-struct arbol-m
  (valor hizq hd1 hd2 hd3))

(define arbolB
  (make-arbol-m
   5
   (make-arbol-m 16
                 (make-arbol-m 5
                               (make-arbol-m 6 '() '() '() '())
                               (make-arbol-m 5 '() '() '() '())
                               (make-arbol-m 3 '() '() '() '())
                               '())
                 (make-arbol-m 7 '() '() '() '())
                 (make-arbol-m 9 '() '() '() '())
                 '())
   (make-arbol-m 8
                 (make-arbol-m 8
                               (make-arbol-m 21 '() '() '() '())
                               (make-arbol-m 22 '() '() '() '())
                               (make-arbol-m 23 '() '() '() '())
                               (make-arbol-m 24 '() '() '() '())
                              )
                 '() '() '())
   (make-arbol-m 9
                 (make-arbol-m 90 '() '() '() '())
                 '() '() '())
   (make-arbol-m 7
                 (make-arbol-m 17
                             (make-arbol-m 35 '() '() '() '())
                             (make-arbol-m 26 '() '() '() '())
                             '() '())
                 (make-arbol-m 22
                               (make-arbol-m 19
                                             (make-arbol-m 7 '() '() '() '())
                                             (make-arbol-m 8 '() '() '() '())
                                             (make-arbol-m 9 '() '() '() '())
                                             '())
                               '() '() '())
                 '() '())))


;;Autor: Carlos A Delgado
;;Fecha: 22 de Enero de 2020
;;Contrato: recorrido-preorden: arbol-m -> lista de números
(define (recorrido-preorden arb)
  (cond
    [(empty? arb) '()]
    [else
     (append
      (cons (arbol-m-valor arb) '())
      (recorrido-preorden (arbol-m-hizq arb))
      (recorrido-preorden (arbol-m-hd1 arb))
      (recorrido-preorden (arbol-m-hd2 arb))
      (recorrido-preorden (arbol-m-hd3 arb)))]))

(recorrido-preorden arbolB)


;;Autor: Carlos A Delgado
;;Fecha: 22 de Enero de 2020
;;Contrato: recorrido-inorden arbol-m -> lista de números
(define (recorrido-inorden arb)
  (cond
    [(empty? arb) '()]
    [else
     (append
      (recorrido-inorden (arbol-m-hizq arb))
            (cons (arbol-m-valor arb) '())
      (recorrido-inorden (arbol-m-hd1 arb))
      (recorrido-inorden (arbol-m-hd2 arb))
      (recorrido-inorden (arbol-m-hd3 arb)))]))


(recorrido-inorden arbolB)


;;Autor: Carlos A Delgado
;;Fecha: 22 de Enero de 2020
;;Contrato: recorrido-posorden arbol-m -> lista de números
(define (recorrido-posorden arb)
  (cond
    [(empty? arb) '()]
    [else
     (append
      (recorrido-posorden (arbol-m-hizq arb))            
      (recorrido-posorden (arbol-m-hd1 arb))
      (recorrido-posorden (arbol-m-hd2 arb))
      (recorrido-posorden (arbol-m-hd3 arb))
      (cons (arbol-m-valor arb) '())
      )]))


(recorrido-posorden arbolB)