#lang racket

(provide leap-year?)

(define (leap-year? year)
  (cond 
   [(not (= (remainder year 4) 0)) #f]
   [(not (= (remainder year 100) 0)) #t]
   [(and (= (remainder year 100) 0) (= (remainder year 400) 0)) #t]
   [else #f]
   ))
