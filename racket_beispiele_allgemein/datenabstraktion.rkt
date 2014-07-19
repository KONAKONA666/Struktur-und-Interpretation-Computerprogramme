#lang racket
(define (cons x y)
  (define (zuteilen m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else (error "Argument nicht 0 oder 1 -- CONS" m))))
  zuteilen)

(define (car z) (z 0))
(define (cdr z) (z 1))

(define x (cons 1 2))
(define y (cons 3 4))
(define z (cons x y))

(car x)
(cdr x)
(car (car z))
(car (cdr z))