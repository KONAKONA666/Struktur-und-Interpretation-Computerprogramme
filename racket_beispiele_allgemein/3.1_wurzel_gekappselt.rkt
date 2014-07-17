#lang racket


; erste Verbesserung durch Blockstruktur (Definitionen/Prozeduren lokal)
;(define (wurzel x)
;  (define (quadrat x)
;    (* x x))
;  (define (mittelwert x y)
;    (/ (+ x y) 2))
;  (define (verbessern schaetzwert x)
;    (mittelwert schaetzwert (/ x schaetzwert)))
;  (define (gut-genug? schaetzwert x)
;    (< (abs (- (quadrat schaetzwert) x)) (/ x 1000.0)))
;  (define (wurzel-iter schaetzwert x)
;    (if (gut-genug? schaetzwert x)
;        schaetzwert
;        (wurzel-iter (verbessern schaetzwert x)
;                     x)))
;  (wurzel-iter 1.0 x))

; x ist nun lexikalisch gebunden,
; denn x ist in der Definition von wurzel gebunden, und die
; Prozeduren gut-genug?, verbessern usw. liegen im
; Geltungsbereich von x.
(define (wurzel x)
  (define (quadrat a)
    (* a a))
  
  (define (mittelwert a b)
    (/ (+ a b) 2))
  
  (define (verbessern schaetzwert)
    (mittelwert schaetzwert (/ x schaetzwert)))
  
  (define (gut-genug? schaetzwert)
    (< (abs (- (quadrat schaetzwert) x)) (/ x 1000.0)))
  
  (define (wurzel-iter schaetzwert)
    (if (gut-genug? schaetzwert)
        schaetzwert
        (wurzel-iter (verbessern schaetzwert))))
                     
  (wurzel-iter 1.0)
  )



(wurzel 25)
(sqrt 25)
(wurzel 0.00025)
(sqrt 0.00025)
(wurzel 0.000000025)
(sqrt   0.000000025)
(wurzel 1300000023)
(sqrt   1300000023)




