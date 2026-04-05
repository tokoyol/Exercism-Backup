#lang racket

(provide my-append
         my-concatenate
         my-filter
         my-length
         my-map
         my-foldl
         my-foldr
         my-reverse)

(define (my-append sequence1 sequence2)
  (if (null? sequence1)
      sequence2
      (cons (car sequence1) (my-append (cdr sequence1) sequence2))))

(define (my-concatenate sequence-of-sequences)
  (if (null? sequence-of-sequences)
      '()
      (my-append (car sequence-of-sequences) (my-concatenate (cdr sequence-of-sequences)))))

(define (my-filter pred sequence)
  (if (null? sequence)
      '()
      (if (pred (car sequence))
          (cons (car sequence) (my-filter pred (cdr sequence)))
          (my-filter pred (cdr sequence)))))

(define (my-length sequence)
  (if (null? sequence)
      0
      (+ 1 (my-length (cdr sequence)))))

(define (my-map operation sequence)
  (if (null? sequence)
      '()
      (cons (operation (car sequence)) (my-map operation (cdr sequence)))))

(define (my-foldl operation accumulator sequence)
  (if (null? sequence)
      accumulator
      (my-foldl operation (operation (car sequence) accumulator) (cdr sequence))))

(define (my-foldr operation accumulator sequence)
  (if (null? sequence)
      accumulator
      (operation (car sequence) (my-foldr operation accumulator (cdr sequence)))))

(define (my-reverse sequence)
  (my-foldl (lambda (x acc) (cons x acc)) '() sequence))
