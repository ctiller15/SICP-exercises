#lang racket
; Linear multiplication is defined as follows:
(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))

(* 5 3) ; 15

; Now, assuming we have two functions 'double' and 'halve' defined for us...
; (I'm going to cheat and use division. Sorry.)
(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))

(define (even? n)
  (= 0 (remainder n 2)))

; Recursive version:
(define (*rec a b)
  (cond ((= 0 b) 0)
        ((even? b) (*rec (double a) (halve b)))
        (else *rec (+ a (*rec a (- b 1))))))

(*rec 5 10)

(*rec 20 30)

; We need to define a procedure that uses a logarithmic number of steps.
; Accidentally did an iterative process. It didn't specify. Whoops!
(define (x a b)
  (mult-helper a b 0))

(define (mult-helper a b n)
  (cond ((= 0 b) n)
        ((even? b) (mult-helper (double a) (halve b) n))
        (else (mult-helper a (- b 1) (+ a n)))))

(x 1 2)

(x 3 5)

(x 10 20)

(x 30 3)