#lang racket
(provide armstrong-number?)
(define (armstrong-number? n)
  (let* ([num-str (number->string n)]
         [num-digits (string-length num-str)]
         [sum (apply + 
                (map (lambda (c) 
                       (expt (string->number (string c)) num-digits))
                     (string->list num-str)))])
    (= n sum)))