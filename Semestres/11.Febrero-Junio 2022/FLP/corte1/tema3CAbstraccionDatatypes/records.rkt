#lang eopl
#|
Para la siguiente gramática

<record> ::= <empty>
                (empty-record)
                ::= <key> <value>
                (value-record (k v))
                ::= <key> <value> <record>
                (value-non-empty (k v r))

<value>  ::= <number>
                (value-num (num))
               ::= <symbol>
                (value-sym (sym))

<key> ::= <symbol> 
      ::= <lista-s>

<lista-s> ::= <symbol>
          ::= <symbol> <lista-s>
|#
(define-datatype record record?
  (empty-record)
  (value-record (k key?)
                (v value?))
  (value-non-empty (k key?)
                   (v value?)
                   (r record?)))

(define-datatype value value?
  (value-num  (num number?))
  (value-sym (sym symbol?)))

(define-datatype key key?
  (key-sym (sym symbol?))
  (key-lista (lst lista-s?)))

(define-datatype lista-s lista-s?
  (lista-sym (s symbol?))
  (list-s (s symbol?) (l lista-s?)))



(define reg (empty-record))

(define reg1 (value-record (key-sym 'l) (value-num 4)))

(define reg2 (value-record (key-lista (list-s 'k (lista-sym 'p))) (value-num 3)))
(define reg3 (value-non-empty (key-lista (list-s 'k (lista-sym 'p))) (value-num 3) (value-record
                                                                                    (key-sym 'r)
                                                                                    (value-sym 'j)
                                                                                    )))
(define reg4 (value-non-empty (key-lista (list-s 'k (lista-sym 'p))) (value-num 3) (value-record
                                                                                    (key-sym 'r)
                                                                                    (value-num 4)
                                                                                    )))

(define reg5 (value-non-empty (key-lista (list-s 'k (lista-sym 'p))) (value-num 3) (value-record
                                                                                    (key-lista (list-s 'ggh (lista-sym 'i)))
                                                                                    (value-num 4)
                                                                                    )))

(define reg6 (value-non-empty (key-lista (list-s 'k (lista-sym 'p))) (value-num 4)

                              (value-non-empty (key-lista (list-s 'k (lista-sym 'p))) (value-num 3)

                              (value-record (key-lista (list-s 'jlh (lista-sym 'h)))(value-num 32)
                                                                                    )
                                               )))

(define reg7 (value-non-empty (key-lista (list-s 'k (lista-sym 'p))) (value-num 4)

                              (value-non-empty (key-lista (list-s 'k (lista-sym 'p))) (value-num 3)

                              (value-non-empty (key-lista (list-s 'jlh (list-s 'jh (lista-sym 'h))))
                                               (value-num 32)
                              (value-record (key-sym 'r) (value-num 6))
                                               )
                                               )))
 


(define plus-record
  (lambda (rec)
    (cases record rec
      (empty-record () 0)
      (value-record (k v)
                    (cases value v
                      (value-num (n) n)
                      (else 0)))
      (value-non-empty (k v r)
                       (+
                        (cases value v
                          (value-num (n) n)
                          (else 0))
                        (plus-record r))))))

(define l-record
  (lambda (rec)
    (cases record rec
      (empty-record () empty)
      (value-record (k v)
                    (cases key k
                      (key-sym (s) (list s))
                      (key-lista (l)
                                 (letrec
                                     (
                                      (listar (lambda (ls)
                                                (cases lista-s ls
                                                  (lista-sym (s2) (list s2))
                                                  (list-s (s2 ls2)
                                                          (append (list s2)
                                                                  (listar ls2))))))
                                    
                                      )
                                   (listar l)))))
      (value-non-empty (k v r)
                        (append
                         (cases key k
                           (key-sym (s) (list s))
                           (key-lista (l)
                                      (letrec
                                          (
                                           (listar (lambda (ls)
                                                     (cases lista-s ls
                                                       (lista-sym (s2) (list s2))
                                                       (list-s (s2 ls2)
                                                               (append (list s2)
                                                                       (listar ls2))))))
                                    
                                           )
                                        (listar l))))
                         (l-record r))))))




(define compare-record
  (lambda (rec1 rec2)
    (cases record rec1
      (empty-record () (cases record rec2
                         (empty-record () #T)
                         (else #F)))
      (value-record (k1 v1)
                    (cases record rec2
                      (value-record (k2 v2)
                                    (and
                                     (cases key k1
                                       (key-sym (s1)
                                                (cases key k2
                                                  (key-sym (s2)
                                                           (eqv? s1 s2))
                                                  (else #F)))
                                       (key-lista (ls1)
                                                  (cases key k2
                                                    (key-lista (ls2)
                                                               (compare-listas ls1 ls2))
                                                    (else #F))))
                                     (cases value v1
                                       (value-num (n1)
                                                  (cases value v2
                                                    (value-num (n2) (= n1 n2))
                                                    (else #F)))
                                       (value-sym (s1)
                                                  (cases value v2
                                                    (value-sym (s2) (eqv? s1 s2))
                                                    (else #F))))
                                     )                                     
                                    )     
                      (else #F)))
      (value-non-empty (k1 v1 r1)
                       (cases record rec2
                         (value-non-empty (k2 v2 r2)
                                          (and
                                           (cases key k1
                                             (key-sym (s1)
                                                      (cases key k2
                                                        (key-sym (s2)
                                                                 (eqv? s1 s2))
                                                        (else #F)))
                                             (key-lista (ls1)
                                                        (cases key k2
                                                          (key-lista (ls2)
                                                                     (compare-listas ls1 ls2))
                                                          (else #F))))
                                           (cases value v1
                                             (value-num (n1)
                                                        (cases value v2
                                                          (value-num (n2) (= n1 n2))
                                                          (else #F)))
                                             (value-sym (s1)
                                                        (cases value v2
                                                          (value-sym (s2) (eqv? s1 s2))
                                                          (else #F))))
                                           
                                           )
                                          (compare-record r1 r2)
                                          )
                         (else #F))
                       )
      )
    )
  )

(define compare-listas
  (lambda (l1 l2)
    (cases lista-s l1
      (lista-sym (s1)
                 (cases lista-s l2
                   (lista-sym (s2) (eqv? s1 s2))
                   (else #F)))
      (list-s (s1 l1)
       (cases lista-s l2
         (list-s (s2 l2)
                 (and
                  (eqv? s1 s2)
                  (compare-listas l1 l2)))
         (else #F))))))








                    




                    







  