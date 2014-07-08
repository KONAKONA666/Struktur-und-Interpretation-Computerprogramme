#lang racket

(define (quadrat x)
  (* x x))

(define (mittelwert x y)
  (/ (+ x y) 2))

(define (verbessern schaetzwert x)
  (mittelwert schaetzwert (/ x schaetzwert)))

(define (gut-genug? schaetzwert x)
  (< (abs (- (quadrat schaetzwert) x)) 0.001))

(define (wurzel-iter schaetzwert x)
  (if (gut-genug? schaetzwert x)
      schaetzwert
      (wurzel-iter (verbessern schaetzwert x)
                   x)))

(define (wurzel x)
  (wurzel-iter 1.0 x))

(wurzel 25)
(sqrt 25)
(wurzel 0.00025)
(sqrt 0.00025)
(wurzel 1300000023)
(sqrt   1300000023)

(define (neues-if praedikat then-klausel else-klausel)
  (cond (praedikat then-klausel)
        (else else-klausel)))

(define (wurzel-iterB schaetzwert x)
  (neues-if (gut-genug? schaetzwert x)
            schaetzwert
            (wurzel-iter (verbessern schaetzwert x)
                         x)))

(wurzel-iterB 1.0 25)
(wurzel-iterB 1.0 1300000023)
(wurzel           1300000023)



