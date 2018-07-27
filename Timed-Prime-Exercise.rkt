#lang racket
; Squares any given number.
(define (square n)
  (* n n))

; checks if a number is even.
(define (even? n)
  (= (remainder n 2) 0))

;====================
;Prime test
;====================

; Begins the whole prime check procedure.
(define (prime? n)
  (= n (smallest-divisor n)))

; Begins a procedure to find the smallest divisor.
(define (smallest-divisor n)
  (find-divisor n 2))

; Actually finds the smallest divisor.
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

; Checks to see if two numbers divide evenly.
(define (divides? a b)
  (= (remainder b a) 0))

(prime? 5)

(prime? 10)

(prime? 47)

;================
;Begin search-for-prime procedures.

;A procedure that searches for the first count# of primes within a given range between
;The specified start and end ranges.
(define (search-for-primes start end count)
      (check-prime start end count (current-inexact-milliseconds)))

; iteratively checks the primality of consecutive odd integers.
(define (check-prime start end count time)
  (cond ((= count 0) "Done searching!")
        ((> start end) "Done searching!")
        ((even? start)(check-prime (+ start 1) end count (current-inexact-milliseconds)))
        ((prime? start) (handle-success start end (- count 1) (- (current-inexact-milliseconds) time)))
        (else (check-prime (+ start 2) end count (current-inexact-milliseconds)))))

(define (handle-success num end newCount time)
  (newline)
  (display num)
  (display " *** ")
  (display time)
  (check-prime (+ num 2) end newCount (current-inexact-milliseconds)))

(search-for-primes 1 11 3)
(search-for-primes 1000 10000 3)
(search-for-primes 10000 100000 3)
(search-for-primes 100000 1000000 3)
(search-for-primes 1000000 10000000 3)
(search-for-primes 10000000 100000000 3)