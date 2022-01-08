;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname extremes) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;;******************************************************************
;;  Louis Song(20884386)
;;  Cs 135 Fall 2020
;;  Assignment 02, Question 2
;;******************************************************************

;;
;;problem a
;;
;;(smallest numlist) produces the smallest number amongst the
;;numbers in numlist

;;Examples :
(check-expect (smallest (cons 3 empty)) 3)
(check-expect (smallest (cons 3 (cons 1 (cons 5 empty)))) 1)

;;smallest : (listof Num) -> Num
(define (smallest numlist)
  (cond [(empty? numlist) (error "The list is empty")]
        [(empty? (rest numlist))(first numlist)]
        [( > (smallest(rest numlist))
             (first numlist))(first numlist)]
        [else (smallest (rest numlist))]))

;;Tests :
(check-expect (smallest (cons 100 (cons -1.1 (cons 0 empty)))) -1.1)
(check-expect (smallest (cons -19 (cons -3
                                  (cons 29 (cons 38 empty))))) -19)


;;
;;problem b
;;
;;(largest numlist) produces the largest number amongst numbers in
;; the numbers in numlist

;;Examples :
(check-expect (largest(cons 4 (cons 5 (cons 6 empty)))) 6)
(check-expect (largest (cons 0 (cons 1 (cons 5 empty)))) 5)

;;largest : (listof Num) -> Num
(define (largest numlist)
  (cond [(empty? numlist) (error "The list is empty")]
        [(empty? (rest numlist))(first numlist)]
        [(> (first numlist) (largest (rest numlist)))
         (first numlist)]
        [else (largest (rest numlist))]))

;;Tests :
(check-expect (largest (cons 100.1 (cons -1 (cons 0 empty)))) 100.1)
(check-expect (largest (cons -19 (cons -3
                                  (cons 29 (cons 38 empty))))) 38)

;;
;;problem c
;;
;;(max-diff numlist) produces the maximum difference between
;;two elemenst amongst the numbers in numlist

;;Examples :
 (check-expect(max-diff(cons 3 (cons 5 (cons 10 empty)))) 7)
 (check-expect(max-diff (cons 3929 (cons 39 empty))) 3890)

;;max-diff : (listof Num) -> Num
(define (max-diff numlist)
  (cond [(empty? numlist) (error "The list is empty")]
        [(empty? (rest numlist)) (first numlist)]
        [( < (- (smallest numlist) (largest numlist))
             (-(largest numlist) (smallest numlist)))
         (-(largest numlist) (smallest numlist))]                                                                                           
        [else (- (smallest numlist) (largest numlist))]))


;;Tests :
(check-expect (max-diff (cons 30202 (cons -1
                                          (cons 0 empty)))) 30203)
(check-expect (max-diff (cons -1 (cons -39
                                 (cons -31 (cons -34 empty))))) 38)



