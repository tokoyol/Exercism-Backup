#lang racket
(provide hamming-distance hamming-helper)

(define (hamming-distance source target)
  (if (not (= (string-length source) (string-length target)))
      (error "strands must be of equal length")
      (hamming-helper (string->list source) (string->list target))))

(define (hamming-helper source target)
  (cond 
   [(zero? (length source)) 0]
   [(eq? (car source) (car target)) (hamming-helper (cdr source) (cdr target))]
   [else (+ 1 (hamming-helper (cdr source) (cdr target)))]))