#lang eopl
(define-datatype arbol-nario arbol-nario?
  (arbol-hoja (num number?))
  (arbol-no-vacio
   (key symbol?)
   (hijos (list-of arbol-nario?))))

(define arbolitoMortal
  (arbol-no-vacio
   'k
   (list (arbol-hoja 3) (arbol-hoja 8) (arbol-no-vacio 'p (list (arbol-hoja 3) (arbol-hoja 8))))))


;;El programador escribe con listas
;;(list 'arbol-no-vacio 'k (list (list 'arbol-hoja 3) ...)

(define unparser
  (lambda (arb)
    (cases arbol-nario arb
      (arbol-hoja (num) (list 'arbol-hoja num))
      (arbol-no-vacio (sym lsthijos)
                      (letrec
                          (
                           (procesar-lista (lambda (lest)
                                             (cond
                                               [(null? lest) '()]
                                               [(cons (unparser (car lest)) (procesar-lista (cdr lest)))]
                                               )
                                             )
                                           )
                           )
                        (list 'arbol-no-vacio sym (procesar-lista lsthijos))
                        )
                      )
      )
    )
  )

(define parser
  (lambda (lst)
    (cond
      [(null? lst) '()]
      [(equal? (car lst) 'arbol-hoja) (arbol-hoja (cadr lst))]
      [(equal? (car lst) 'arbol-no-vacio)
       (letrec
           (
            (operar-lista (lambda (lis)
                            (cond
                              [(null? lis) '()]
                              [else  (cons (parser (car lis)) (operar-lista (cdr lis)))]
                              )
                            ))
            )
         (arbol-no-vacio (cadr lst) (operar-lista (caddr lst))))])))