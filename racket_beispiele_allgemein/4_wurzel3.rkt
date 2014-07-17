#lang racket
; dritte Wurzel ziehen
; dritte Wurzel aus x = y
; (x/y*y + 2y) / 3      y = schaetzwert startet mit 1.0

(define (quadrat a)
  (* a a)
  )

(define (hoch3 a)
  (* a a a)
  )

(define (wurzel3-iter schaetzwert x)
  (if (gut-genug? schaetzwert x)
      schaetzwert
      (wurzel3-iter (verbessern schaetzwert x) x)
   )
  )

(define (gut-genug? schaetzwert x)
  (< (abs (- (hoch3 schaetzwert) x)) (/ x 1000.0))
  )

(define (verbessern schaetzwert x)
  (/ (+ (/ x (quadrat schaetzwert)) (* 2 schaetzwert)) 3)
  )

(define (wurzel3 x)
  (wurzel3-iter 1.0 x)
  )

(wurzel3 27)
