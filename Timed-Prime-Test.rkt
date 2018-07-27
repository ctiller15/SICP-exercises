#lang racket
(define (square n)
  (* n n))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (timed-prime-test n)
  (newline)
  (display n)
  (current-inexact-milliseconds)
  (start-prime-test n (current-inexact-milliseconds)))

(define (start-prime-test n start-time)
  current-inexact-milliseconds
  (if (prime? n)
      (report-prime (- (current-inexact-milliseconds) start-time))
      " is not prime"))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(current-inexact-milliseconds)
(timed-prime-test 4)
(current-inexact-milliseconds)

(current-inexact-milliseconds)
(timed-prime-test 5)
(current-inexact-milliseconds)

(timed-prime-test 47)

(timed-prime-test 199999999)





