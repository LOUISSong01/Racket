;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname translations) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;;******************************************************************
;;  Louis Song(20884386)
;;  Cs 135 Fall 2020
;;  Assignment 01, Question 2
;;******************************************************************

;; Question (a)
;;(volume r) produce the volume of
;;   a sphere whose radius is r
;;Examples
(check-within (volume 2) 33.510 .001)
(check-within (volume 4) 268.083 .001)


;; volume : Num -> Num
;; Requires : r > 0
(define (volume r)
  (*(* pi (expt r 3)) (/ 4 3)))


;;Tests
(check-within (volume 53.5) 641431.015 .001)
(check-within (volume 18.6) 26954.262 .001)


;;Question(b)
;; (fib n) produces Fibonacci number
;;   consuming an integer n(n>0)
;;Examples
(check-within (fib 1) 1 .001)
(check-within (fib 4) 3 .001)
(check-within (fib 5) 5 .001)

;; fib : Nat -> Num
;; Requires: n > 0
(define phi
  (/(+ 1 (sqrt 5)) 2))
(define (fib n)
  (/ (- (expt phi n)
        (expt (- 0 phi) (- 0 n)))
     (-(* 2 phi) 1)))

;;Tests
(check-within (fib 21) 10946 .001)
(check-within (fib 34) 5702887 .001)