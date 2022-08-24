;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname 2-BuscarMayorAcumuladores) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))
;;buscar-mayor-lista: lista de numeros -> numero

(define (buscar-mayor-lista lnum)
     (cond
         [(empty? lnum) (error "Debe al menos existir un numero")]
         [(= (length lnum) 1) (first lnum)]
         [else
             (local
               (
                    (define (buscar-mayor-aux lnumD mayor)
                            (cond
                               [(empty? lnumD) mayor]
                               [(> (first lnumD) mayor)
                                (buscar-mayor-aux (rest lnumD) (first lnumD))
                               ]
                               [else  (buscar-mayor-aux (rest lnumD) mayor)]
                           ) 
                       )
               )
               (buscar-mayor-aux lnum (first lnum))
               )
             ]
         )
  )


 (buscar-mayor-lista (list 4 5 8 1 9 90 1000 4 5))