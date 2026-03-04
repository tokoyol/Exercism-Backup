#lang racket

(provide response-for)

(define (is-silence? prompt)
  (string=? (string-trim prompt) "")
)

(define (is-yelling? msg)
  (let ([letters (filter char-alphabetic? (string->list msg))])
    (and (not (null? letters))              ; must have at least one letter
         (andmap char-upper-case? letters)))) ; all letters must be uppercase

(define (is-question? msg)
  (equal? (string-ref (string-trim msg) (- (string-length (string-trim msg)) 1)) #\?))

(define (is-yelled-question? prompt)
  (and (is-yelling? prompt) (is-question? prompt)))

(define (response-for prompt)
  (cond 
        [(is-silence? prompt) "Fine. Be that way!"]
        [(is-yelled-question? prompt) "Calm down, I know what I'm doing!"]
        [(is-yelling? prompt) "Whoa, chill out!"]
        [(is-question? prompt) "Sure."]
        [else "Whatever."]
   ))
