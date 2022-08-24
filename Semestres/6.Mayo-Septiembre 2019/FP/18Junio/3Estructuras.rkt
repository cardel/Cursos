;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 3Estructuras) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
(define-struct amigo
  (nombre edad altura))

(define amigoA (make-amigo 'David 23 180))

;;
;;(actualizar-amigo amigoA 1 10 'Mario)
;;(make-amigo 'Mario 23 180)
;;(actualizar-amigo amigoA 2 10 'Mario)
;;(make-amigo 'David 10 180)
;;(actualizar-amigo amigoA 3 10 'Mario)
;;(make-amigo 'David 23 10)
;;Autor: Carlos A Delgado
;;Contrato: actualizar-amigo: amigo, numero, numero, simbolo -> amigo
;;Descripción: Permite actualizar una estructura tipo amigo
;;Ejemplos ...
;;Código
(define (actualizar-amigo friend numA numB sym)
  (cond
    [(= numA 1)
     (make-amigo
      sym
      (amigo-edad friend)
      (amigo-altura friend))]
    [(= numA 2)
     (make-amigo
      (amigo-nombre friend)
      numB
      (amigo-altura friend))]
    [else
     (make-amigo
      (amigo-nombre friend)
      (amigo-edad friend)
      numB)]
    )
  )
(check-expect (actualizar-amigo amigoA 1 10 'Mario)
(make-amigo 'Mario 23 180))
(check-expect(actualizar-amigo amigoA 2 10 'Mario)
(make-amigo 'David 10 180))
(check-expect(actualizar-amigo amigoA 3 10 'Mario)
(make-amigo 'David 23 10))