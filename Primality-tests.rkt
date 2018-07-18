#lang racket
(define (square n)
  (* n n))

; A procedure that finds the smallest divisor of a number n.
(define (smallest-divisor n)
  (find-divisor n 2))

; finds the smallest divisor.
(define (find-divisor n test-divisor)
  ; If the square of the test divisor is greater than the number, return the number.
  (cond ((> (square test-divisor) n) n)
        ; If it evenly divides, then that is the smallest divisor. Return it.
        ((divides? test-divisor n) test-divisor)
        ; Otherwise, re-run the procedure with the next integer.
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

; n is prime iff n is its own smallest divisor.
(define (prime? n)
  (= n (smallest-divisor n)))

(prime? 5)

(prime? 7)

(prime? 20)

(prime? 41)

; The Fermat test.

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(fast-prime? 5 10)

(fast-prime? 7 10)

(fast-prime? 20 10)

(fast-prime? 41 10)

(prime? 199)

(prime? 1999)

(prime? 19999)

