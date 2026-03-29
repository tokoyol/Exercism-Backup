#lang racket

(provide isbn?)

(define (isbn? isbn)
  (let ([l (string->list (string-replace isbn "-" ""))])
    (if (= (length l) 10)
        (let ([result (formula l 10)])
          (and result (= (modulo result 11) 0)))
        #f)))
(define (char->digit-no-x c)
  (if (char-numeric? c)
      (- (char->integer c) (char->integer #\0))
      #f))

(define (formula l position)
  (if (null? l)
      0
      (let ([d (if (and (char=? (car l) #\X) (= position 1))
                   10
                   (char->digit-no-x (car l)))])
        (if (not d)
            #f
            (let ([rest (formula (cdr l) (- position 1))])
              (if rest
                  (+ (* d position) rest)
                  #f))))))