#lang eopl

;; <declaracion> := {<declaracion> ; <declaracion>}
;;               := while <expresion> do <declaracion>
;;               := <identificador> = <expresion>
;;
;; <expresion> := <identificador>
;;             := (<expresion> + <expresion)

;;  { x = (y + z); while x do x = r}
;;  while y do {x = r ; x = (r + s)}


;;Especificación lexica

(define especificacion-lexica
  '(
    (espacio-blanco (whitespace) skip)
    (identificador (letter (arbno (or digit letter))) symbol)
    (numero (digit (arbno digit)) number)
    (comentario ("$" (arbno (not #\newline))) skip)
    (comentario-largo ("!-" (arbno (not  #\newline))) skip)
    )
  )

;;Definición gramátical

(define especificacion-gramatical
  '(
    (declaracion ("{" declaracion ";" declaracion "}") decl-exp)
    (declaracion ("while" expresion "do" declaracion) while-exp)
    (declaracion (identificador "=" expresion) assigndecl-exp)
    (expresion (identificador) id-exp)
    (expresion ("(" expresion "+" expresion ")" ) add-exp)
    )
  
  )

;;Construccion de los Datatypes

(sllgen:make-define||-datatypes especificacion-lexica especificacion-gramatical)

(define show-the-datatypes
  (lambda () (sllgen:list-define-datatypes especificacion-lexica especificacion-gramatical)))


;El FrontEnd (Análisis léxico (scanner) y sintáctico (parser) integrados)

(define scan&parse
  (sllgen:make-string-parser especificacion-lexica especificacion-gramatical))

;El Analizador Léxico (Scanner)

(define just-scan
  (sllgen:make-string-scanner especificacion-lexica especificacion-gramatical))

;;Interpretador
(define interpretador
  (sllgen:make-rep-loop "Cinco pa mi=) "
    (lambda (pgm) (evaluar-programa pgm))
    (sllgen:make-stream-parser 
      especificacion-lexica
      especificacion-gramatical)))

(define evaluar-programa
  (lambda (pgm)
    (cases declaracion pgm
      (decl-exp (d1 d2) (list d1 d2))
      (while-exp (exp1 d1) (list exp1 d1))
      (assigndecl-exp (id exp) (list id exp))
      )
    )
  )


   ;(declaracion ("{" declaracion ";" declaracion "}") decl-exp)
    ;(declaracion ("while" expresion "do" declaracion) while-exp)
    ;(declaracion (identificador "=" expresion) assigndecl-exp)