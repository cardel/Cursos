;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ejemploNotacionPrefija) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
(/
 (sqr (+ 1 (/ 4 7) 8))
 (+ 5 -3 (/ (expt 8 3) (+ 7 3 (- (expt 8 3)))))
 )


(/ (+ (expt (- 2 7) 3)
      (/ (+ (sqr 8) (* 2 (- 6 3)))
         (* (- 7 3) (- 9 4))
         )
      )
   (+ (sqr 8) (* 6 4) 7)
   )