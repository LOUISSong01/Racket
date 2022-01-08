;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname not-lists) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;******************************************************************
;;  Louis Song(20884386)
;;  Cs 135 Fall 2020
;;  A05 Question 1
;;******************************************************************
(define-struct ls (first rest))
;; A (lsof X) is one of:
;; * 'nothing
;; * (make-ls X (lsof X))
;;
;;
;;question 1a
;;
;;(ls-length strct) consumes a structure,strct and produces the
;;  number of values in it.
;;Examples:
(check-expect (ls-length (make-ls "!"
                                  (make-ls 'huh
                                           (make-ls 42 'nothing)))) 3)

;;ls-length : (lsof Any) -> Nat
(define (ls-length strct)
  (cond [(equal? strct 'nothing) 1]
        [(equal? (ls-rest strct) 'nothing) 1]
          [(ls? strct) (add1 (ls-length (ls-rest strct)))]))

;;Tests
(check-expect (ls-length'nothing) 1)
(check-expect (ls-length (make-ls 3 'nothing)) 1)
(check-expect (ls-length
               (make-ls 'nothing
                        (make-ls 4 (make-ls 5 'nothing))))3)
;;
;;
;;question 1b
;;
;;(ls-max strct) consumes a structure,strct that contains number
;;values and produces the largest value amongst the values.
;;
;;Examples:
(check-expect (ls-max (make-ls 5 (make-ls 9 (make-ls 7 'nothing)))) 9)

;;ls-max : (lsof Num) -> Num
(define (ls-max strct)
  (cond [(equal? strct 'nothing) 'false]
        [(equal? (ls-rest strct) 'nothing) (ls-first strct)]
        [(>= (ls-first strct)
             (ls-max (ls-rest strct))) (ls-first strct)]
         [else (ls-max (ls-rest strct))]))

;;Tests:
(check-expect (ls-max 'nothing)'false)
(check-expect (ls-max (make-ls 3 'nothing)) 3)

        
        


