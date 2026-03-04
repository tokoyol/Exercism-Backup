#lang racket

(provide binary-search)

(define (binary-helper array value start end)
  (if (> start end)
      #f
      (let ([mid (quotient (+ start end) 2)])
        (cond
             [(= (vector-ref array mid) value) mid]
             [(> (vector-ref array mid) value) (binary-helper array value start (- mid 1))]
             [else (binary-helper array value (+ 1 mid) end)]
         )
      
   )))

(define (binary-search array value)
  (binary-helper array value 0 (- (vector-length array) 1)))