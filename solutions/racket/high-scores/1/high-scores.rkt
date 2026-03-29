#lang racket

(provide high-scores%)

(define high-scores%
  (class object%
    (super-new)
    (init-field values)
    (define/public (personal-best) (apply max values))
    (define/public (scores) values)
    (define/public (latest) (last values))
    (define/public (personal-top-three) (take (sort values >) (min 3 (length values))))))
  
