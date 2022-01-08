;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname valid-date) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;;******************************************************************
;;  Louis Song(20884386)
;;  Cs 135 Fall 2020
;;  Assignment 01, Question 5a and 5b
;;******************************************************************

;;(valid-date? Nat) identify whether certain natural number
;;   is a valid date or not
;;Examples
(check-expect (valid-date? 20010918) true)
(check-expect (valid-date? 19831412) false)

;;Nat -> Bool
;;Requires : Nat => 0 (There is an year 0)
(define (valid-date? Nat)
(cond [(equal? (Julian Nat) false) false]
      [(and(equal? (leap-year? Nat) false)
           (= (modulo Nat 10000) 0229))false]
      [(and(and (< 0 (modulo Nat 100))(<=(modulo Nat 100) 31))
       (and (<= 0 (- (modulo Nat 10000)(modulo Nat 100)))
       (>= 1200 (- (modulo Nat 10000) (modulo Nat 100))))) true]
      [else false]))

;;Tests
(check-expect (valid-date? 00011010) true)
(check-expect (valid-date? 17520913) false)
(check-expect (valid-date? 129391932911212) true)
(check-expect (valid-date? 17000229) false)



;; (Julian Nat) produces false if Nat represents unexisting date
;;     on Julian calendar otherwise true.
;; Examples
(check-expect(Julian 17520913) false)
(check-expect(Julian 20011012) true)

;;Nat -> Bool
(define(Julian Nat)
  (cond[(and (>= 17520913 Nat) (<= 17520903 Nat)) false]
                        [else true]))

;;No tests described as this is a helper function

;;(leap-year? Nat) identify whether certain year,Nat
;;   is a leap year or not
;;Examples
(check-expect (leap-year? 2004) true)
(check-expect (leap-year? 1500) false)

;;Nat -> Bool
;;Requires : Nat=> 0
;;Requires :year => 0 (pretend there is an year 0)
(define (leap-year? Nat) (cond[(= (remainder Nat 400) 0) true]
                               [(= (remainder Nat 100) 0) false]
                               [(= (remainder Nat 4) 0) true]
                               [else false]))
;;Tests
(check-expect (leap-year? 1700) false)
(check-expect (leap-year? 3) false)
(check-expect (leap-year? 2048) true)
                  

                           

  


