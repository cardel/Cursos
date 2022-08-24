#lang eopl

;;
;;<cola> := <cola-vacia>
  ;;     := <cola-no-vacia> <cola> <int>

(define-datatype cola cola?
  (cola-vacia)
  (cola-no-vacia (cola cola?)
                 (num number?))
  )



;;extract

(define top
  (lambda (col)
    (cases cola col
      (cola-vacia ()(eopl:error "no se puede extraer el primero de un vacio"))
      (cola-no-vacia (cola-in num) (cases cola cola-in
                                    (cola-vacia () num)
                                    (cola-no-vacia (top cola-in)))) 
      )
    )
  )


(define pop
  (lambda (col)
    (cases cola col
      (cola-vacia () (eopl:error "no se puede extraer,la cola está vacia"))
      (cola-no-vacia (cola-in num) (cases cola cola-in
                                    (cola-vacia () (cola-vacia))
                                    (cola-no-vacia (cola-no-vacia (pop cola-in)num))))
      
      )
    )
  )

(define suma
  (lambda (col)
    (cases cola col
      (cola-vacia () 0)
      (cola-no-vacia (cola-in num) (+ num (suma cola-in))))
    )
  )

;;ejemplos
  
(define a(cola-no-vacia (cola-no-vacia (cola-no-vacia (cola-vacia)2 )3 )4))
(define colab (cola-no-vacia (cola-no-vacia
         (cola-no-vacia
            (cola-no-vacia (cola-vacia) 3)
              4)
              5)
              6))
