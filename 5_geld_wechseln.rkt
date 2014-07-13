#lang racket
(define (wechselgeld betrag)
  (wg betrag 5))

(define (wg betrag muenzarten)
  (cond ((= betrag 0) 1)
        ((or (< betrag 0) (= muenzarten 0)) 0)
        (else (+ (wg betrag
                     (- muenzarten 1))
                 (wg (- betrag
                        (erster-nennwert muenzarten))
                     muenzarten)))))

(define (erster-nennwert muenzarten)
  (cond ((= muenzarten 1) 1)
        ((= muenzarten 2) 2)
        ((= muenzarten 3) 5)
        ((= muenzarten 4) 10)
        ((= muenzarten 5) 50)))

"wechsel 100"
(wechselgeld 100)
"wechsel 1"
(wechselgeld 1)
"wechsel 2"
(wechselgeld 2)
"wechsel 3"
(wechselgeld 3)
"wechsel 4"
(wechselgeld 4)
"wechsel 5"
(wechselgeld 5)
"wechsel 6"
(wechselgeld 6)


