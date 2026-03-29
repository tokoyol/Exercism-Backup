#lang racket

(provide isogram?)

(define (isogram? s)
  (let ([l (filter (lambda (c) (not (member c '(#\- #\space))))
                   (string->list (string-downcase s)))])
    (= (set-count (list->set l)) (length l))))
