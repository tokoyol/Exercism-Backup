#lang racket

(provide number->eggs)

(define (number->eggs n)
  (define (count-bits x acc)
    (if (= x 0)
        acc
        (count-bits (arithmetic-shift x -1)
                    (+ acc (bitwise-and x 1)))))
  (count-bits n 0))

