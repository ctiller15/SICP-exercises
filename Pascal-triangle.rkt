#lang racket
(define (pascal-recursive x y)
  (cond ((= y 0) 0)
    ((> y x) 0)
    ((= x 1) 1)
    (else (+ (pascal-recursive (- x 1) (- y 1)) (pascal-recursive (- x 1) y)))))

(pascal-recursive 1 1) ; 1

(pascal-recursive 4 2) ; 3

(pascal-recursive 5 3) ; 6

(pascal-recursive 6 4) ; 10

(define (! n)
  (if (= n 1) 1
      ( * n (! (- n 1)))))

; An iterative version of pascal's triangle. It uses a function x choose y to calculate the correct value.
(define (pascal-iterative x y)
  (define (triangle-iter x y ind sum)
    (cond ((= y 0) 0)
          ((> y x) 0)
          ((= x 1) 1)
          ((= ind (+ (- x y) 1)) sum)
          (else (triangle-iter x y (+ ind 1)
                               (/ (! (- x 1)) (* (! (- y 1)) (! (- x y))))))))
  (triangle-iter x y 1 1))

(pascal-iterative 1 1) ; 1

(pascal-iterative 4 2) ; 3

(pascal-iterative 5 3) ; 6

(pascal-iterative 6 4) ; 10