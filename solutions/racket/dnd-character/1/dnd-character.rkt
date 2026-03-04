#lang racket

(provide (struct-out character)
         ability
         make-character
         modifier)

(struct character
    (strength dexterity constitution intelligence wisdom charisma hitpoints)) ; Add necessary struct fields

(define (ability)
  (let ([one (random 1 7)]
        [two (random 1 7)]
        [three (random 1 7)]
        [four (random 1 7)])
    (- (+ one two three four) (min one two three four))))

(define (modifier value)
  (floor (/ (- value 10) 2)))

(define (make-character)
  (let ([str (ability)]
        [dex (ability)]
        [con (ability)]
        [int (ability)]
        [wis (ability)]
        [cha (ability)])
    (character str dex con int wis cha (+ 10 (modifier con)))
        ))
