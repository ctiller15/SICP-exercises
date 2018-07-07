#lang racket
; Calculates the square of a value.
(define (square x)
  (* x x))

; Averages two values.
(define (average x y)
  (/ (+ x y) 2))

; Calculates absolute value of a number.
(define (abs x)
  (if (< x 0)
      (- x)
      x))

; Checks if square differs from radicand
; by less than a predetermined tolerance.
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

; Improves the guess by averaging it with the quotient
; Of the radicand and the old guess.
(define (improve guess x)
  (average guess (/ x guess)))

; Will check the square root by constantly improving a guess.
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)

(sqrt (+ 100 37))

(sqrt (+ (sqrt 2) (sqrt 3)))

(square (sqrt 1000))