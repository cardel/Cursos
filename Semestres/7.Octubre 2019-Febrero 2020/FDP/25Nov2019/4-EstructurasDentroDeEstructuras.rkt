;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4-EstructurasDentroDeEstructuras) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
(define-struct computador (marca precio cpu disco-duro tarjeta-video))

(define-struct cpu (marca velocidad num-nucleos mem-cache))
(define-struct disco-duro (marca velocidad capacidad))
(define-struct tarjeta-video (marca velocidad num-nucleos mem-video))

(define computadorA
  (make-computador
   'Asus
   3000
   (make-cpu 'AMD 4 12 5)
   (make-disco-duro 'Toshiba 7200 1)
   (make-tarjeta-video 'Nvidia 1.5 2000 4)
   )
  )

(computador-marca computadorA)
(computador-precio computadorA)
(computador-cpu computadorA)
(computador-disco-duro computadorA)
(computador-tarjeta-video computadorA)

;;Quiero extraer la marca de la cpu
;;1. Extraer la cpu del computador
;;2. Extraigo la marca de la cpu
(cpu-marca (computador-cpu computadorA))


;;QUiero extraer la mem-video de la tarjeta-video
(tarjeta-video-mem-video (computador-tarjeta-video computadorA))

;;Ejemplo sencillo

(define-struct amigo (nombre direccion))
(define-struct direccion (localizacion num-casa))
(define-struct localizacion (calle carrera barrio))

(define amigo1 (make-amigo 'Jhon
                           (make-direccion
                            (make-localizacion 13 26 'Farfan)
                            13)))

(localizacion-calle (direccion-localizacion  (amigo-direccion amigo1)))

