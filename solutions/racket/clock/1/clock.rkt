#lang racket

(provide clock
         add
         subtract
         clock->string)
(struct clock-struct (hours minutes) #:transparent)

(define (clock h m)
  (let* ([total-minutes (+ (* h 60) m)]
         [normalized-minutes (modulo total-minutes 1440)]
         [final-hours (quotient normalized-minutes 60)]
         [final-minutes (remainder normalized-minutes 60)])
    (clock-struct final-hours final-minutes)))

(define (clock->string c)
  (string-append
   (if (< (clock-struct-hours c) 10) 
       (string-append "0" (number->string(clock-struct-hours c)))
       (number->string (clock-struct-hours c)))
   ":"
   (if (< (clock-struct-minutes c) 10) 
       (string-append "0" (number->string(clock-struct-minutes c)))
       (number->string (clock-struct-minutes c)))))

(define (add c minutes)
  (clock (clock-struct-hours c)
         (+ (clock-struct-minutes c) minutes)))

(define (subtract c minutes)
  (clock (clock-struct-hours c)
         (- (clock-struct-minutes c) minutes)))
