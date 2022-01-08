;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname division) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;;******************************************************************
;;  Louis Song(20884386)
;;  Cs 135 Fall 2020
;;  Assignment 03, Question 5
;;******************************************************************
;;
;;question 5
;;
;;
;;(divide a b) consumes two natural numbers a and b, and produces
;;quotient and remainder.
;;
;;Examples:
(check-expect (divide 17 6) (cons 2 (cons 5 empty)))
(check-expect (divide 18 6) (cons 3 (cons 0 empty)))
;;divide : Nat Nat -> listofNat



;;Tests :
(check-expect (divide 16 6) (cons 2 (cons 4 empty)))
(check-expect (divide 1 0) (cons 0 (cons 1 empty)))
