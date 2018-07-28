#lang racket
; Prime test setup.
(define (square n)
  (* n n))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (next num)
  (if (= num 2) 3
      (+ num 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(prime? 5)

; timed test setup.
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-inexact-milliseconds)))

(define (start-prime-test n start-time)
  (if (prime? n) (report-prime (- (current-inexact-milliseconds) start-time))
      "Not prime!"))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(timed-prime-test 1009)

(timed-prime-test 1000000007)
(timed-prime-test 1000000009)
(timed-prime-test 1000000021)

(timed-prime-test 10000000019)
(timed-prime-test 10000000033)
(timed-prime-test 10000000061)

(timed-prime-test 100000000003)
(timed-prime-test 100000000019)
(timed-prime-test 100000000057)

(timed-prime-test 1000000000039)
(timed-prime-test 1000000000061)
(timed-prime-test 1000000000063)

; Not QUITE half as fast as the previous procedure. We need to run an extra if-check which slows it down slightly.



