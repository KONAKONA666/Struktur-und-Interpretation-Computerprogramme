#lang racket
(define pi 3.14159)
(define radius 10)
(define umfang (* 2 pi radius))
umfang
pi
(*(+ 3 4 5)(- 10 6))


(define (summe a b)
  (+ a b))

(summe 10 2)

;(define (drei a b c)
;  (cond  [(and (> a b) (> b c))]  (+ a b c)
;         [else (+ a b c)] 
;        )
;  )


;(drei 5 4 3)

(define (drei a b c)
  (cond
    [(and (> a c)
          (> b c))
     (+ (* a a) (* b b))]
    [(and (> b a)
          (> c a))
     (+ (* b b) (* c c))]
    [(and (> a b)
          (> c b))
     (+ (* a a) (* c c))]
    [else -1]
  )
)

(drei 3 2 1)
(drei 1 2 3)
(drei 2 1 3)
(drei 3 1 2)
(drei 1 3 2)
(drei 2 3 1)

(drei 1 1 1)
(drei 2 2 1)


(/ (+ 5(+ 4 (- 2 (- 3 (+ 6 (/ 4 5))))))
   (* 3 (- 6 2) (- 2 7)))