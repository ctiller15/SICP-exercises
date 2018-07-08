#lang racket
; recursively does a factorial
(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial(- n 1)))))

; iteratively does a factorial
(define (factorial-iterative n)
  (fact-iter 1 1 n))

; The iteration tool for the factorial.
(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count)))

; The same iterative factorial procedure, but using a block structure.
(define (factorial-iter-block n)
  (define (iter product counter)
    (if (> counter n)
        product
        (iter (* counter product)
              (+ counter 1))))
  (iter 1 1))