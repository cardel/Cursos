#lang eopl

(define in-S1?
  (lambda (l)
    (cond
      [(and
        (= (car l) 0)
        (= (cadr l) 1)) #T]
      [(or
        (< (car l) 0)
        (< (cadr l) 1)) #F]
      [else (in-S1? (list (- (car l) 1)
                         (- (cadr l) 7)))])))


(define in-S2?
  (lambda (l)
    (cond
      [(and
        (= (car l) 0)
        (= (cadr l) 1)) #T]
      [(or
        (< (car l) 0)
        (< (cadr l) 1)) #F]
      [else (in-S2? (list (- (car l) 1)
                         (/ (cadr l) 2)))])))
