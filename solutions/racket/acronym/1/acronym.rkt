#lang racket
(provide acronym)
(define (acronym phrase)
  (string-upcase
   (list->string
    (map (lambda (word) (string-ref word 0))
         (filter (lambda (s) (not (string=? s "s")))
                 (remove "" (string-split phrase #px"[^a-zA-Z]+")))))))