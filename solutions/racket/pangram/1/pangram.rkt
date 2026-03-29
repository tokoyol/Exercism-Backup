#lang racket

(provide pangram?)

(define (pangram? sentence)
  (= (set-count (list->set (filter char-alphabetic? (string->list (string-downcase sentence))))) 26))
