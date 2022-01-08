;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname parity) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;;******************************************************************
;;  Louis Song(20884386)
;;  Cs 135 Fall 2020
;;  Assignment 02, Question 5
;;******************************************************************
;;
;;(parity str) determines whether the certain string has 'odd number
;; of 1 or 'even number of 1.
;;Examples:
(check-expect (parity "1111001") 'odd)
(check-expect (parity "111111") 'even)

;;parity : Str -> Sym
(define (parity str)
  (cond [ (even? (count-char/list #\1 (Strtolst str))) 'even]
        [else 'odd]))

;;Tests :
(check-expect (parity "3333001") 'odd)
(check-expect (parity "1111111111") 'even)
(check-expect (parity "0000000000") 'even)


;;(count-char/list ch str) shows the number of certain charcter ch
;;in the list of string, str
;;Examples:
(check-expect (count-char/list #\p (cons #\p (cons #\p empty))) 2)
(check-expect (count-char/list #\s (cons #\p (cons #\p empty))) 0)

;; count-char/list: Char (listof Char) -> Nat
(define (count-char/list ch str)
  (cond
    [(empty? str)0]
    [else 
       (cond [(char=? ch (first str)) 
              (+ 1 (count-char/list ch (rest str)))]
             [else                    
              (count-char/list ch (rest str))])]))

;;(Strtolst str) changes string to the list of strings
;;Examples :
(check-expect (Strtolst "Adam")
              (cons #\A (cons #\d (cons #\a( cons #\m empty)))))
(check-expect (Strtolst "SNAP")
              (cons #\S (cons #\N (cons #\A( cons #\P empty)))))


;;Strtolst : Str ->(ListofStr)
(define (Strtolst str)
  (string->list str))