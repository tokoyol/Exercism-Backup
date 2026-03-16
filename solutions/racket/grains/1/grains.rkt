#lang racket

(provide square total)

(define (square a-square)
  (helper a-square 1))

(define (helper target count)
  (if (= target count) 1
      (* 2 (helper target (+ 1 count)))))

;; (define (total)
;;   (helper2 64 1))

;; (define (helper2 target count)
;;   (if (= target count) (square count)
;;       (+ (square count) (helper2 target (+ 1 count)))))

(define (total)
  (apply + (map square (range 1 65))))
