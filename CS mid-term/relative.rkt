;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname relative) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;******************************************************************
;;  Louis Song(20884386)
;;  Cs 135 Fall 2020
;;  MT02 Question 3
;;******************************************************************
;;
;;
;;(relative->absolute lst) consumes a list of integers, lst and
;;produces the values that result from adding these values, one at a
;;time,starting from initial value of 0.
;;
;;Examples
(check-expect (relative->absolute '(3 -2 4)) '(3 1 5))
(check-expect (relative->absolute empty) empty)

;;relative->absolute lst : (listof Int) -> (listof Int)
(define (relative->absolute lst)
  (cond [(empty? lst) empty]
        [else  (cons (+ 0 (first lst)) (add3 lst))]))

(define (add lst)
  (cond [(empty? (rest lst)) empty]
        [else (cons (+ (first lst) (first (rest lst)))
                    (add (rest lst)))]))

(define (add2 lst)
  (cond [(empty? (rest lst)) empty]
        [else (cons (+ (first lst) (first (rest lst)))
                    (rest (rest lst)))]))

(define (add3 lst)
  (cond [(empty?  lst)empty]
        [else (cons (first (add2 lst))
                    (cons (+ (first (add2 lst)) (second (add2 lst)))
                    (add3(rest(rest(rest lst))))))]))
             
         


                    

