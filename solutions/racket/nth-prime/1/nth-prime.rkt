#lang racket

(provide nth-prime)

(define (nth-prime number)
  (if (< number 1)
      (error "there is no zeroth prime")
      (find-prime 2 1 number)))

(define (find-prime current count n)
  (if (is-prime current)
      (if (= count n)
          current
          (find-prime (+ 1 current) (+ 1 count) n))
      (find-prime (+ 1 current) count n)))
(define (is-prime n)
  (if (< n 2)
      #f
      (if (= n 2)
          #t
          (check-divisor n 2))))
(define (check-divisor n d)
  (if (= (remainder n d) 0)
      #f
      (if (> (* d d) n)
          #t
          (check-divisor n (+ 1 d)))))
