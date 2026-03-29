#lang racket

(provide format-message)

(define (format-message name number)
  (format "~a, you are the ~a~a customer we serve today. Thank you!" name number (get-suffix number)))

(define (get-suffix number)
  (cond
       [(= (remainder number 100) 11) "th"]
       [(= (remainder number 100) 12) "th"]
       [(= (remainder number 100) 13) "th"]
       [(= (remainder number 10) 1) "st"]
       [(= (remainder number 10) 2) "nd"]
       [(= (remainder number 10) 3) "rd"]
       [else "th"]
   ))
