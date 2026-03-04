#lang racket

(provide collatz)

(define (collatz num)
  (cond 
        [(<= num 0) (error "Only positive integers are allowed")]
        [(= num 1) 0]
        [(odd? num) (+ 1 (collatz (+ 1 (* 3 num))))]
        [else (+ 1 (collatz (quotient num 2)))]
   ))
