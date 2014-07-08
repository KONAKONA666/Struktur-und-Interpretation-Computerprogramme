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
"Bei sehr kleinen Zahlen versagt gut-genug?"
(wurzel 0.00025)
(sqrt 0.00025)
(wurzel 0.000000025)
(sqrt   0.000000025)
"Das liegt daran, dass der Unterschied von 0.001 zu generisch ist."
"Bei kleinen Zahlen ist 0.001 zu ungenau."
(wurzel 1300000023)
(sqrt   1300000023)

(define (gut-genug-genauer? schaetzwert x)
  (< (abs (- (quadrat schaetzwert) x)) (/ x 1000.0)))

(define (wurzel-iter-genauer schaetzwert x)
  (if (gut-genug-genauer? schaetzwert x)
      schaetzwert
      (wurzel-iter-genauer (verbessern schaetzwert x)
                   x)))

(define (wurzel-genauer x)
  (wurzel-iter-genauer 1.0 x))

; if wird durch eine normael Prozedur mit Hilfe von cond definiert
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

"Jetzt genauer..."
(wurzel-genauer 0.0000025)
(sqrt           0.0000025)




