;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname warmup) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;;******************************************************************
;;  Louis Song(20884386)
;;  Cs 135 Fall 2020
;;  Assignment 03, Question 1
;;******************************************************************
;;
;;problem a
;;
;;(replace-word str1 str2 listofStr) consumes two strings,
;;str1 and str2, and a list of strings and
;;produces a new list where the first
;; string is replaced by the second string.

;;Examples :
(check-expect
 (replace-word "apple" "pear"  (cons "mango" (cons "apple"
                               (cons "grape" empty))))
 (cons "mango" (cons "pear" (cons "grape" empty))))

;;replace-word : Str Str listofStr -> listofStr
(define (replace-word str1 str2 listofStr)
  (cond[(empty? listofStr) empty]
       [(empty? (rest listofStr)) (first listofStr)]
       [(equal? str1 (first listofStr))
        (cons str2 (replace-word (rest listofStr)))]
       [else (cons (first listofStr)
                   (replace-word str1 str2 (rest listofStr)))]))

;;
;;
;;problem b
;;
;;
;;(add nat1 nat2) consumes two natural numbesrs
;;nat 1 and nat2 to produce their sum

;;Examples :
(check-expect (add 1 3) 4)
(check-expect (add 0 1) 1)

;;add : Nat Nat -> Nat
;;Requires: nat1 =>0
;;nat2 => 0
(define (add nat1 nat2)
  (cond [(or (< nat1 0) (< nat2 0)) "not natural numbers"]
        [(zero? nat2) nat1]
        [(zero? nat1) nat2]
        [else (add (add1 nat1) (sub1 nat2))]))

;;Tests
(check-expect (add 0 0) 0)
(check-expect (add -1 3) "not natural numbers")
(check-expect (add 1000 32) 1032)


;;
;;
;;problem c
;;
;;
;;(mult nat1 nat2) consumes two natural numbers, nat1 and nat2
;;and produces their product.

;;Examples :
(check-expect (mult 3 2) 6)
(check-expect (mult 10 3) 30)

;;mult : Nat Nat -> Nat
;;Require : nat1 =>0
;;nat2 =>0
(define (mult nat1 nat2)
  (cond [(or (< nat1 0) (< nat2 0)) "not natural numbers"]
        [(or (= nat1 0) (= nat2 0)) 0]
        [else (add nat1 (mult nat1 (sub1 nat2)))]))

;;Tests
(check-expect (mult 3 2) 6)
(check-expect (mult 1000 0) 0)
(check-expect (mult 0 0) 0)
(check-expect (mult 1000 1000) 1000000)
(check-expect (mult -2 -2) "not natural numbers")




          