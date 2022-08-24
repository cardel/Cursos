#lang eopl
(define lista-Svacia
          (lambda ()
              (lambda (signal sym)
                   (cond
                      [ (= signal 0) 'vacia]
                      [ (= signal 3) #F]
                      [else (eopl:error "Error")]
                    ))))

(define lista-SNovacia
          (lambda (ls lss)
              (lambda (signal sym)
                   (cond
                      [ (= signal 0) 'noVacia]
                      [ (= signal 1 ) ls]
                      [ (= signal 2) lss]
                      [ (= signal 3) 
                          (if (ls 3 sym) #T (lss 3 sym))]
                    ))))

(define lista-SNoVacia?
  (lambda (lss)
    (eqv? (lss 0 'a) 'noVacia)))

(define lista-Svacia?
  (lambda (lss)
    (eqv? (lss 0 'a) 'vacia)))
    

(define sim
       (lambda (x)
          (lambda (signal sym)
            (cond
               [ (= signal 0) 'simbolo]
               [ (= signal 1) x]
               [ (= signal 3)  (eqv? x sym)]
               [else (eopl:error "error")]
             ))))


(define lsim
      (lambda (x ls)
        (lambda (signal sym)4
             (cond
               [ (= signal 0) 'simbolo]
               [ (= signal 1) x]
               [ (= signal 2) ls]
               [ (= signal 3)  (if (eqv? x sym) #T (ls 3 sym))]
               [else (eopl:error "error")]
             ))))   


;;' (  (a b c) (c d e f) e)

 (define listaListaSimbolos
     (lista-SNovacia
      (lsim
       'a
       (lsim 'b
             (lsim 'c (sim 'd))))
      (lista-SNovacia
       (lsim
        'c (lsim 'd (lsim 'e (sim 'f))))
       (lista-SNovacia
        (sim 'e)
        (lista-Svacia)))))

(define buscar-simbolo
  (lambda (lss sym)
    (lss 3 sym)))