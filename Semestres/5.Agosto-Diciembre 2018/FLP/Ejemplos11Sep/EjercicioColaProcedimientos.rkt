#lang eopl

;;ej rep-lista

;;<cola> := <cola-vacia>
      ;;:= <cola-no-vacia> <cola> <int>

;; constructor

;;cola vacia
(define cola-vacia
  (lambda ()
    (list 'cola-vacia)
    )
  )
;;cola no vacia
(define cola-no-vacia
  (lambda ( cola num)
    (list 'cola-no-vacia cola num)
    )
  )


;;observador

(define cola-vacia?
  (lambda (exp)
    (eqv? (car exp) 'cola-vacia)
    )
  )

(define cola-no-vacia?
  (lambda (exp)
    (eqv? (car exp) 'cola-no-vacia)
    )
  )




;;extract



(define top
  (lambda (cola)
    (cond
      [(cola-vacia? (cadr cola)) (caddr cola ) ]
      [else (top (cadr cola))])
    )
  )

(define pop
  (lambda (cola)
    (cond
      [(cola-vacia? (cadr cola)) (cola-vacia) ]
      [else (cola-no-vacia (pop (cadr cola)) (caddr cola) )])
      )
  )


(define suma
  (lambda (cola)
    (cond
      [(cola-vacia? cola) 0]
      [(+ (top cola ) (suma (pop cola)))]))
  )

(define a(cola-no-vacia (cola-no-vacia (cola-no-vacia (cola-vacia)2 )3 )4))

(define colab (cola-no-vacia (cola-no-vacia
         (cola-no-vacia
            (cola-no-vacia (cola-vacia) 3)
              4)
              5)
              6))
