;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4-Listas2) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
(define sistema-solar
  (cons 'mercurio (cons 'venus (cons 'tierra 
 (cons 'marte (cons 'jupiter (cons 'saturno
   (cons 'urano (cons 'neptuno empty)))))))))

;;PRmero
(first sistema-solar)

;;Resto
(rest sistema-solar)


;;Segundo
 (first (rest sistema-solar))

 ;;Resto del resto
 (rest (rest sistema-solar))

 ;;Tercero
 (first (rest (rest sistema-solar))
     )


;;Tamaño
(length sistema-solar)
(length (rest sistema-solar))
(length (rest (rest (rest (rest sistema-solar)))))