#lang racket
; Based on (x/(y^2) + 2y) / 3

; Computes a square
(define (square val)
  (* val val))

; Calculates absolute value of a number.
(define (abs x)
  (if (< x 0)
      (- x)
      x))

; Computes the third of two values.
(define (third x y)
  (/ (+ x y) 3))

; figures out what the next value will be based off of the current value
; and the original approximation formula given.
(define (improve guess x)
  (third (/ x (square guess)) (* 2 guess)))

; Checks if the relative difference is small enough for the answer to be considered satisfactory.
(define (good-enough? guess nextGuess)
  (< (abs(- 1 (abs (/ guess nextGuess)))) 0.0001))

; runs the iteration
(define (cube-root-iter guess x)
  (if (good-enough? guess (improve guess x))
      (improve guess x)
      (cube-root-iter (improve guess x) x)))

; starts iteration. Continues running till difference is satisfactory.
(define (cube-root x)
  (cube-root-iter 1.0 x))

(cube-root 27)

(cube-root 8)

(cube-root 64)