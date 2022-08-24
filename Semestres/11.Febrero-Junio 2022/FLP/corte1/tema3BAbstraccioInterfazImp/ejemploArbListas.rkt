#lang eopl
#|
<registro> ::=(register-num) <simbolo> <num>  
                  ::=(register-sym) <simbolo> <simbolo>
                 ::=(register-l-num) <simbolo> <num> <registro>
                  ::=(register-l-sym) <simbolo> <simbolo> <registro>

1) Lista de simbolos
2) Lista de numeros
3) Sume los numeros
4) Retorne un par simbolo, valor de acuerdo de simbolo de
busque
Listas y proc

(register-num 'x 4)
(register-sym 'x 'y)
(register-l-num 'x 4 (register-l-num 'y 4 (register-sym 'x 'x)))
(register-l-sym 'p 'x (register-sym 'x 'y))) 
|#

;;Constructor
(define register-num
  (lambda (s v)
    (list 'register-num s v)))

(define register-sym
  (lambda (s v)
    (list 'register-sym s v)))

(define register-l-num
  (lambda (s v r)
    (list 'register-l-num s v r)))

(define register-l-sym
  (lambda (s v r)
    (list 'register-l-sym s v r)))

;;Observadores

;;Predicados

(define register-num?
  (lambda (r)
    (eqv? 'register-num (car r))))

(define register-sym?
  (lambda (r)
    (eqv? 'register-sym (car r))))

(define register-l-num?
  (lambda (r)
    (eqv? 'register-l-num (car r))))

(define register-l-sym?
  (lambda (r)
    (eqv? 'register-l-sym (car r))))

;;Extractores
(define register-num->key
  (lambda (r)
    (cadr r)))

(define register-num->value
  (lambda (r)
    (caddr r)))

(define register-sym->key
  (lambda (r)
    (cadr r)))

(define register-sym->value
  (lambda (r)
    (caddr r)))

(define register-l-num->key
  (lambda (r)
    (cadr r)))

(define register-l-num->value
  (lambda (r)
    (caddr r)))

(define register-l-num->reg
  (lambda (r)
    (cadddr r)))


(define register-l-sym->key
  (lambda (r)
    (cadr r)))

(define register-l-sym->value
  (lambda (r)
    (caddr r)))

(define register-l-sym->reg
  (lambda (r)
    (cadddr r)))


;;Programador

(define reg1 (register-num 'x 4))
(define reg2 (register-sym 'x 'y))
(define reg3 (register-l-num 'x 4 (register-l-num 'y 4 (register-sym 'x 'x))))
(define reg4 (register-l-sym 'p 'x (register-sym 'x 'y)))

#|
1) Lista de simbolos
2) Lista de numeros
3) Sume los numeros
4) Retorne un par simbolo, valor de acuerdo de simbolo de
busque
|#
(define reg->listsym
  (lambda (reg)
    (cond
      [(register-num? reg) (list (register-num->key reg))]
      [(register-sym? reg) (list (register-sym->key reg) (register-sym->value reg))]
      [(register-l-num? reg)
       (append
        (list (register-l-num->key reg))
        (reg->listsym (register-l-num->reg reg)))]
      [(register-l-sym? reg)
       (append
        (list (register-l-sym->key reg) (register-l-sym->value reg))
        (reg->listsym (register-l-sym->reg reg)))]
      [else (eopl:error "Estructura no válida")])))

(define reg->listnum
  (lambda (reg)
    (cond
      [(register-num? reg) (list (register-num->value reg))]
      [(register-sym? reg) '()]
      [(register-l-num? reg)
       (append
        (list (register-l-sym->value reg))
        (reg->listnum (register-l-num->reg reg)))]
      [(register-l-sym? reg)
        (reg->listnum (register-l-sym->reg reg))]
      [else (eopl:error "Estructura no válida")])))

(define sumita
  (lambda (reg)
    (cond
      [(register-num? reg) (register-num->value reg)]
      [(register-sym? reg) 0]
      [(register-l-num? reg)
       (+
        (register-l-sym->value reg)
        (sumita (register-l-num->reg reg)))]
      [(register-l-sym? reg)
        (sumita (register-l-sym->reg reg))]
      [else (eopl:error "Estructura no válida")])))

(define buscar
  (lambda (reg key)
    (cond
      [(register-num? reg) (if (eqv? key (register-num->key reg))
                               (list (register-num->key reg) (register-num->value reg))
                               '()
                               )]
      [(register-sym? reg) (if (eqv? key (register-sym->key reg))
                               (list (register-sym->key reg) (register-sym->value reg))
                               '()
                               )]
      [(register-l-num? reg)
       (if (eqv? key (register-l-num->key reg))
           (list (register-l-num->key reg) (register-l-num->value reg))
           (buscar (register-l-num->reg reg) key))]
      [(register-l-sym? reg)
        (if (eqv? key (register-l-sym->key reg))
           (list (register-l-sym->key reg) (register-l-sym->value reg))
           (buscar (register-l-sym->reg reg) key))]
      [else (eopl:error "Estructura no válida")])))