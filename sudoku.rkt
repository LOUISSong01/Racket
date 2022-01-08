;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname sudoku) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;;******************************************************************
;;  Louis Song(20884386)
;;  Cs 135 Fall 2020
;;  Assignment 02, Question 4
;;******************************************************************

;;(sudoku-valid?) consumes a list of numbers and produces 'true if
;; the list of numbers contain only each of the numbersone throuh
;;nine exactly,or produces false otherwise.

;;Examples
(check-expect(sudoku-valid?(cons 3 (cons 2 (cons 3 (cons 4 (cons 5
(cons 9 (cons 8 (cons 7 (cons 6 empty))))))))))'false)
(check-expect(sudoku-valid(cons 3 (cons 9 (cons 2(cons 4 (cons 5
(cons 9 (cons 8 (cons 7 (cons 1 empty))))))))))'true)

;;sudoku-valid? : (listof Int) -> Sym

(define (sudoku-valid? Intlst)
  (cond [ (and ( = (count-char/list #\1 Intlst) 1)( = (count-char/list #\7 Intlst) 1)
               ( = (count-char/list #\3 Intlst) 1)( = (count-char/list #\2 Intlst) 1)
               ( = (count-char/list #\4 Intlst) 1)( = (count-char/list #\8 Intlst) 1)
               ( = (count-char/list #\5 Intlst) 1)( = (count-char/list #\9 Intlst) 1)
               ( = (count-char/list #\6 Intlst) 1)) 'true]
        [else 'false]))
              


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