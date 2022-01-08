;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname fact) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;;******************************************************************
;;  Louis Song(20884386)
;;  Cs 135 Fall 2020
;;  Mid-term Question 2
;;******************************************************************
;;
;;(factorialize listNat) consumes a list of natural numbers,
;;listNat and produces a corresponding list of naturals
;;after applying factorial functions.
;;
;; Examples :
(check-expect
    (factorialize (cons 3 (cons 5 (cons 4 empty))))
    (cons 6(cons 120 (cons 24 empty))))
(check-expect
    (factorialize (cons 0 (cons 3 (cons 4 empty))))
    (cons 1(cons 6 (cons 24 empty))))

;; factorialize : (listof Nat) -> (listof Nat)
(define (factorialize listNat)
  (cond
    [(empty? listNat) empty]
    [else (cons (factorial (first listNat))
                (factorialize (rest listNat)))]))

;; Tests :
(check-expect
    (factorialize (cons 0 (cons 0 (cons 0 empty))))
    (cons 1(cons 1 (cons 1 empty))))
(check-expect
    (factorialize (cons 12 (cons 10 (cons 0 empty))))
    (cons 479001600(cons 3628800 (cons 1 empty))))

;;(factorial x) consumes a natural number x,
;; and produces a factorial of x. This is a helper function.
;;
;;Examples :
(check-expect
     (factorial 0) 1)
(check-expect
     (factorial 3) 6)
;;factorial : Nat -> Nat
;;Requiers : x =>0
(define (factorial x)
  (cond
    [(zero? x) 1]
    [else (* x (factorial (sub1 x)))]))
;;Examples covered all the cases.