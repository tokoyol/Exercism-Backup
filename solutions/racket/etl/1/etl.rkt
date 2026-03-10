#lang racket

(provide etl)

(define (etl input)
  (for*/hash ([(score letters) (in-hash input)]
              [_ (in-value (when (< score 0)
                             (raise-argument-error 'transform 
                                                   "non-negative integer" 
                                                   score)))]
              [letter (in-list letters)])
    (values (string-downcase letter) score)))
