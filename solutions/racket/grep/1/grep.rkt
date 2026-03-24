#lang racket
(require racket/string)
(provide grep)

(define (grep flags pattern files)
  (let ([case-insensitive? (member "-i" flags)]
        [invert?           (member "-v" flags)]
        [line-numbers?     (member "-n" flags)]
        [files-only?       (member "-l" flags)]
        [entire-line?      (member "-x" flags)])
    (if files-only?
        (files-only pattern files case-insensitive? entire-line?)
        (for*/list ([file files]
                    [(line idx) (in-indexed (file->lines file))]
                    #:when (if invert?
                               (not (matches? line pattern case-insensitive? entire-line?))
                               (matches? line pattern case-insensitive? entire-line?)))
          (format-line line file idx line-numbers? (> (length files) 1))))))

(define (matches? line pattern case-insensitive? entire-line?)
  (let ([l (if case-insensitive? (string-downcase line) line)]
        [p (if case-insensitive? (string-downcase pattern) pattern)])
    (cond
      [entire-line?  (string=? l p)]
      [else (regexp-match (regexp-quote p) l)])))

(define (files-only pattern files case-insensitive entire-line)
  (filter (lambda (file)
            (ormap (lambda (line) (matches? line pattern case-insensitive entire-line)) (file->lines file))) files))

(define (format-line line file idx line-numbers? multiple-files?)
  (let ([num-prefix (if line-numbers? (format "~a:" (+ idx 1)) "")]
        [file-prefix (if multiple-files? (format "~a:" file) "")])
    (string-append file-prefix num-prefix line)))