;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ejemplosClase) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))

(define-struct computador (marca capA capM marcaProc))
;;Autor: Carlos Delgado
;;Fecha 11 de Feb 2019
;;Contrato: buscar-computador-mejor-memoria: computador, computador, computador, computador -> computador
;;Propósito: Retornar el computador que tenga más memoria dentro de un grupo de 4 computadores
(define (buscar-computador-mejor-memoria com1 com2 com3 com4)
  (cond
    [(and (> (computador-capM com1) (computador-capM com2))
          (> (computador-capM com1) (computador-capM com3))
          (> (computador-capM com1) (computador-capM com4)))
     com1]
    [(and (> (computador-capM com2) (computador-capM com3))
          (> (computador-capM com2) (computador-capM com4)))
     com2]
    [(> (computador-capM com3) (computador-capM com4)) com3]
    [else com4]))


(define computadorA (make-computador 'Dell 100 4 'Intel))
(define computadorB (make-computador 'HP 150 8 'AMD))
(define computadorC (make-computador 'Asus 200 16 'Intel))
(define computadorD (make-computador 'Lenovo 80  64 'Intel))

(check-expect (buscar-computador-mejor-memoria computadorA
                                                computadorB
                                                computadorC
                                                computadorD)
              computadorD)



;;Autor: Carlos Delgado
;;Fecha: 11 de Feb 2019
;;Contrato: actualizar-computador: computador, simbolo, numero -> computador
;;Propósito: Actualizar un campo de la estructura computador de acuerdo a un simbolo
;;Pruebas ...
(define (actualizar-computador comp sim num)
  (cond
    [(symbol=? 'memoria sim) (make-computador
                              (computador-marca comp)
                              (computador-capA comp)
                              num
                              (computador-marcaProc comp))]
    [(symbol=? sim 'disco) (make-computador
                            (computador-marca comp)
                            num
                            (computador-capM comp)
                            (computador-marcaProc comp))]
    [else comp])
  )

(actualizar-computador computadorA 'memoria 64)
(actualizar-computador computadorB 'disco 1000)
(actualizar-computador computadorC 'video 1000)

;**************

(define-struct computadorConTarjeta (marca capA capM proc video))
(define-struct procesador (marca velocidad))
(define-struct tarjetaVideo (marca memoria velocidad))
;;Autor: Carlos Delgado
;;Fecha: 11 de Feb 2019
;;Contrato: buscar-computador-mejor-velocidad: computador, computador, computador, computador -> computador
;;Propósito: Encontrar dentro de 4 computadores el más veloz en procesador
;;Ejemplo ...


(define (buscar-computador-mejor-velocidad com1 com2 com3 com4)
  (cond
    [(and (> (procesador-velocidad (computadorConTarjeta-proc com1)) (procesador-velocidad (computadorConTarjeta-proc com2)))
          (> (procesador-velocidad (computadorConTarjeta-proc com1)) (procesador-velocidad (computadorConTarjeta-proc com3)))
          (> (procesador-velocidad (computadorConTarjeta-proc com1)) (procesador-velocidad (computadorConTarjeta-proc com4))))
     com1]
    [(and (> (procesador-velocidad (computadorConTarjeta-proc com2)) (procesador-velocidad (computadorConTarjeta-proc com3)))
          (> (procesador-velocidad (computadorConTarjeta-proc com2)) (procesador-velocidad (computadorConTarjeta-proc com4))))
     com2]
    [(> (procesador-velocidad (computadorConTarjeta-proc com3)) (procesador-velocidad (computadorConTarjeta-proc com4))) com3]
    [else com4]))


(define computadorT1 (make-computadorConTarjeta 'Chino 500 4
                                                (make-procesador 'Intel 2.5)
                                                (make-tarjetaVideo 'Geforce 200 3.6)
                                                ))

(define computadorT2 (make-computadorConTarjeta 'Gato 200 6
                                                (make-procesador 'AMD 3)
                                                (make-tarjetaVideo 'Nvidia 100 2.5)
                                                ))


(define computadorT3 (make-computadorConTarjeta 'Perro 100 12
                                                (make-procesador 'I5 5)
                                                (make-tarjetaVideo 'Avon 1050 10)
                                                ))
(define computadorT4 (make-computadorConTarjeta 'Pajarito 80 10
                                                (make-procesador 'I10 8)
                                                (make-tarjetaVideo 'HD 300 6)
                                                ))


(buscar-computador-mejor-velocidad computadorT1 computadorT2 computadorT3 computadorT4)


;;Autor: Carlos Delgado
;;Fecha: 11-Feb-2019
;;Contrato: actualizar-computadorV2: computadorConTarjeta, simbolo, numero
;;Propósito: Se recibe una estructura computador y de acuerdo al simbolo se actualiza un campo
(define (actualizar-computadorV2 comp sim num)
  (cond
    [(symbol=? 'memoria sim) (make-computadorConTarjeta
                              (computadorConTarjeta-marca comp)
                              (computadorConTarjeta-capA comp)
                              num
                              (computadorConTarjeta-proc comp)
                              (computadorConTarjeta-video comp)
                              )]
    [(symbol=? sim 'disco) (make-computadorConTarjeta
                            (computadorConTarjeta-marca comp)
                            num
                            (computadorConTarjeta-capM comp)
                            (computadorConTarjeta-proc comp)
                            (computadorConTarjeta-video comp))]
    [(symbol=? sim 'procesador)
     (make-computadorConTarjeta
      (computadorConTarjeta-marca comp)
      (computadorConTarjeta-capA comp)
      (computadorConTarjeta-capM comp)
      (make-procesador
       (procesador-marca (computadorConTarjeta-proc comp))
       num)
      (computadorConTarjeta-video comp))]
    [(symbol=? sim 'video)
     (make-computadorConTarjeta
      (computadorConTarjeta-marca comp)
      (computadorConTarjeta-capA comp)
      (computadorConTarjeta-capM comp)
      (computadorConTarjeta-proc comp)
      (make-tarjetaVideo
       (tarjetaVideo-marca (computadorConTarjeta-video comp))
       (tarjetaVideo-memoria (computadorConTarjeta-video comp))
       num
      )
      )
     ]
    [(symbol=? sim 'videoMemoria)
     (make-computadorConTarjeta
      (computadorConTarjeta-marca comp)
      (computadorConTarjeta-capA comp)
      (computadorConTarjeta-capM comp)
      (computadorConTarjeta-proc comp)
      (make-tarjetaVideo
       (tarjetaVideo-marca (computadorConTarjeta-video comp))
       num
       (tarjetaVideo-velocidad (computadorConTarjeta-video comp))
      )
      )
     ]
    [else comp])
  )

(define computadorT5 (make-computadorConTarjeta 'Gallo 40 20
                                                (make-procesador 'AMD 15)
                                                (make-tarjetaVideo 'Leonisa 50 3)
                                                ))

(actualizar-computadorV2 computadorT5 'procesador 30)
(actualizar-computadorV2 computadorT5 'video 8)
(actualizar-computadorV2 computadorT5 'videoMemoria 100)


;;Tenemos una lista de computadores con Tarjeta
;;Quiero sumar las memorias de todos los computadores
;;Estos vienen una lista de tamaño arbitrario

(define listaC (cons computadorT1 (cons computadorT2
                                        (cons computadorT3
                                              (cons computadorT4
                                                    (cons computadorT1 empty))))))


;;Autor: Carlos Delgado
;;Fecha: 18-Feb-2019
;;Contrato: sumar-capM: lista de computadores -> numero
;;Proposito: Sumar la capacidades de memoria de una lista de computadores arbitrariamente larga
;;Ejemplos (sumar-capM listaC) -> 36
(define (sumar-capM listaC)
  (cond
    [(empty? listaC) 0]
    [else
     (+ (computadorConTarjeta-capM (first listaC))
        (sumar-capM (rest listaC))
        )
     ]
    )
  