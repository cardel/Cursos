#lang eopl

;;
;;<cola> := <cola-vacia>
  ;;     := <cola-no-vacia> <cola> <int>



;;constructor

(define cola-vacia
  (lambda ()
    (lambda (signal)
      (cond
        [(= signal 1) 'cola-vacia]
        
        [else (eopl:error "señal no válida")]
        )))
  )

(define cola-no-vacia
  (lambda (cola num)
           (lambda (signal)
             (cond
               [(= signal 1) 'cola-no-vacia]
               [(= signal 2) num]
               [(= signal 3) cola]
               
               [else (eopl:error "señal no válida")]
               )
             )
           )
    )

;;observ

(define cola-vacia?
  (lambda (exp)
    (eqv? (exp 1) 'cola-vacia)
    )
  )

(define cola-no-vacia?
  (lambda (exp)
    (eqv? (exp 1) 'cola-no-vacia)
    )
  )


;;extractores


(define top
  (lambda (exp)
    (cond
      [(cola-vacia? (exp 3)) (exp 2) ]
      [else  (top (exp 3))]
      )
    )
  )

(define pop
  (lambda (exp)
    (cond
      [(cola-vacia? (exp 3)) (cola-vacia) ]
      [else  (cola-no-vacia (pop (exp 3)) (exp 2) )]
      
      )
    )
  )


(define suma
  (lambda (exp)
    (cond
      [(cola-vacia? exp) 0]
      [(+ (top exp ) (suma (pop exp)))]
      )
    )
  )

;;ejemplo
  
(define a(cola-no-vacia (cola-no-vacia (cola-no-vacia (cola-vacia)2 )3 )4))
(define colab (cola-no-vacia (cola-no-vacia
         (cola-no-vacia
            (cola-no-vacia (cola-vacia) 3)
              4)
              5)
              6))
