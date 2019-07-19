#lang racket

(define (cube x) (* x x x))

(cube 5)

(define (sum-integers a b)
  (if (> a b)
      0
      ; recursively iterates through and sums all elements between a and b.
      (+ a (sum-integers (+ a 1) b))))

(sum-integers 1 5)

(define (sum-cubes a b)
  (if (> a b)
      0
      (+ (cube a) (sum-cubes (+ a 1) b))))

(sum-cubes 1 5)

(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2))) (pi-sum (+ a 4) b))))

(pi-sum 1 5)

; Creating a generalized procedure
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (inc n) (+ n 1))

(define (sum-cubes-2 a b)
  (sum cube a inc b))

(sum-cubes-2 1 10)
; 3025

; Defining the identity function. Just returns itself.
(define (identity x) x)

; Defining the sum integers method in terms of the generalized sum procedure and the identity function.
(define (sum-integers-2 a b)
  (sum identity a inc b))

(sum-integers-2 1 10)

; Defining procedures inside of a procedure scopes them to that procedure.
(define (pi-sum-2 a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

(* 8 (pi-sum-2 1 1000))

; We can build out more complex computations.
(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
    (* (sum f (+ a (/ dx 2.0)) add-dx b)
       dx))

(integral cube 0 1 0.01)

(integral cube 0 1 .001)