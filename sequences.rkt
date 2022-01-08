;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname sequences) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;;******************************************************************
;;  Louis Song(20884386)
;;  Cs 135 Fall 2020
;;  Assignment 01, Question 3
;;******************************************************************


;;(sequence-type a b c d) classify a certain sequence
;;   composed of a b c d as one of arithmetic, geometric, both,
;;   or neither
;; Examples;
(check-expect (sequence-type 1 2 4 8) 'geometric)
(check-expect (sequence-type 4 5 6 7) 'arithmetic)

;; sequence-type : Num Num Num Num -> Sym
(define (sequence-type a b c d)
  (cond [(and (or (= a 0) (= b 0) (= c 0) (= d 0))
         (arithmetic a b c d)) 'arithmetic]
        [(and (arithmetic a b c d) (geometric a b c d)) 'both]
        [(arithmetic a b c d)'arithmetic]
        [(geometric a b c d)'geometric]
        [else 'neither]))

;; Tests:
(check-expect (sequence-type 1 1 1 1) 'both)
(check-expect (sequence-type 3 8 4 2) 'neither)
(check-expect (sequence-type -1 -2 -4 -8) 'geometric)
(check-expect (sequence-type -4 -3.5 -3 -2.5) 'arithmetic)
(check-expect (sequence-type 0 0 0 0) 'arithmetic)
(check-expect (sequence-type -2 0 2 4) 'arithmetic)

;;(arithmetic a b c d) to check whether certain sequence
;;   is an arithmetic sequence or not
;;Examples
(check-expect (arithmetic 1 2 3 4) true)

;;arithmetic num num num num ->Bool
(define (arithmetic a b c d)
  (cond [(=(- b a) (- c b) (- d c)) true]
        [else false]))

;;Tests
(check-expect (arithmetic 0 1 2 3) true)
(check-expect (arithmetic -1 0 1 2) true)

;;(geometric a b c d) to check whether certain sequence
;;   is a geometric sequence or not
;;Examples
(check-expect (geometric 1 2 4 8) true)

;;gemoetric num num num num ->Bool
(define (geometric a b c d)
  (cond [(or (= 0 a ) (= 0 b) (= 0 c) (= 0 d)) false]
        [(=(/ b a) (/ c b) (/ d c)) true]
        [else false]))

;;Tests
(check-expect (geometric -1 -2 -4 -8) true)
(check-expect (geometric 0 3 2 1) false)

