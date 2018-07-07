#lang racket
(define (>= x y)
  (or (> x y) (= x y)))

(define (square x)
  (* x x))

(define (sumSquares x y)
  (+ (square x) (square y)))

(define (<= x y)
  (or (< x y) (= x y)))

(define (largestTwo x y z)
  (cond ((and (<= x y) (<= x z)) (sumSquares y z))
       ((and (<= y x) (<= y z)) (sumSquares x z))
       ((and (<= z x)  (<= z y)) (sumSquares x y))))