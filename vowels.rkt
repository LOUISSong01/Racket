;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname vowels) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;;******************************************************************
;;  Louis Song(20884386)
;;  Cs 135 Fall 2020
;;  Assignment 03, Question 2
;;******************************************************************
;;
;;
;;(total-vowels listofStr) computes the number of
;;vowels in a given list.
;;
;;
;;Examples :
(check-expect (total-vowels (cons "abaa" (cons "bbb" empty))) 3)
(check-expect (total-vowels (cons "ccc" (cons "bbb" empty))) 0)
;;total-vowels : listofStr -> Nat
(define (total-vowels listofStr)
  (+ 1 ( equal? (or (count-vowels (first listofStr)) "a")
                (first (count-vowels (first listofStr))" e")
                (first (count-vowels (first listofStr))"o")
                (first (count-vowels (first listofStr)) "i")
                (first (count-vowels (first listofStr)) "u"))))


 (define (count-vowels listofStr)
   (string->list (first listofStr)) (count-vowels (rest listofStr))))

;;Tests :
(check-expect (total-vowels (cons "abaa"
                                  (cons "bbb"
                                        (cons "oiu" empty))) 6)
(check-expect (total-vowels (cons "ccc"
                                  (cons "bbb"
                                        (cons "iii" empty))) 3)
