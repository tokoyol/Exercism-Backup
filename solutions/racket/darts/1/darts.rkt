#lang racket

(provide score)

(define (score x y)
  (cond 
   [(> (abs (distance x y)) 10) 0]
   [(> (abs (distance x y)) 5) 1]
   [(> (abs (distance x y)) 1) 5]
   [else 10]))

(define (distance x y)
  (sqrt (+ (expt x 2) (expt y 2))))
