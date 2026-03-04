#lang racket

(provide encode decode)

(define (encode-char c)
  (cond
    [(char-alphabetic? c)
     (let* ([pos (- (char->integer (char-downcase c)) (char->integer #\a))]
            [new-pos (- 25 pos)])
       (integer->char (+ new-pos (char->integer #\a))))]
    [(char-numeric? c) c]
    [else #f]))  ; return #f for punctuation, filter it out later

(define (chunk-string str chunk-size)
  (let loop ([remaining str]
             [result '()])
    (if (string=? remaining "")
        (string-join (reverse result) " ")  ; base case: done, join chunks
        (let* ([len (string-length remaining)]
               [take-n (min chunk-size len)]  ; take up to chunk-size chars
               [chunk (substring remaining 0 take-n)]
               [rest (substring remaining take-n)])
          (loop rest (cons chunk result))))))

(define (encode message)
  (let* ([chars (map encode-char (string->list message))]
         [filtered (filter identity chars)]  ; removes #f values
         [encoded-str (list->string filtered)])
    (chunk-string encoded-str 5)
    ))
(define (decode-char m)
  (cond
       [(char-alphabetic? m)
        (let* ([pos (- (char->integer (char-downcase m)) (char->integer #\a))]
               [new-pos (- 25 pos)])
          (integer->char (+ new-pos (char->integer #\a))))]
   [(char-numeric? m) m]
   [else #f]))

(define (decode message)
  (let* ([chars (map decode-char (string->list message))]
         [filtered (filter identity chars)]
         [decoded-str (list->string filtered)])
    decoded-str))
