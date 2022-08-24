;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 5-OrdenamientoEmai) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
(define-struct email (remitente destinatorio mensaje))

;;Contrato: insertar: lista de email, email -> lista de email
(define (insertar lemail email)
    (cond
         [(empty? lemail) (cons email empty)]
         [(string<? (email-remitente email) (email-remitente (first lemail))) (cons email lemail)]
         [else (cons (first lemail) (insertar (rest lemail) email))]
         )
  )

;(insertar (cons 1 (cons 2 (cons 4 empty))) 3)
 ;; (cons 1 (cons 2 (cons 3 (cons 4 empty))))
;(insertar (cons 2 (cons 4 (cons 8 empty))) 12)
;;(cons 2 (cons 4 (cons 8 (cons 12 empty))))

;;Ordenar: lista de emails -> lista de emails
(define (ordenar lemail)
  (cond
    [(empty? lemail) '()]
    [else
     (insertar (ordenar (rest lemail)) (first lemail))]))

(define listaCorreos
  (cons
   (make-email "chucho" "jorge" "i love you")
   (cons
    (make-email "diego" "yepes" "te veo más tarde")
    (cons
     (make-email "ana" "daniel" "te deje por otro mejor")
     (cons
      (make-email "eduardo" "isabella" "nos vemos después de fdp :')")
      empty)))))

(ordenar listaCorreos)