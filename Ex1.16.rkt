#lang racket
(define (even? n)
  (= (remainder n 2) 0))

(even? 10)

(define (sq n)
  (* n n))

(sq 5)

(define (** b n)
  (**-iter b n 1))

(define (**-iter b n a)
  (cond ((= n 1) a)
        ((even? n) (**-iter b (/ n 2) (* a (sq b))))
        ( else (**-iter b (- n 1) (* a b)))))

(** 5 4)