#lang racket

(provide sum-of-squares square-of-sum difference)

(define (sum-of-squares number)
  (for/sum ([i (in-range 1 (+ number 1))])
           (expt i 2)))

(define (square-of-sum number)
  (expt (for/sum([i (in-range 1 (+ number 1))]) i) 2))

(define (difference number)
  (abs (- (sum-of-squares number) (square-of-sum number))))
