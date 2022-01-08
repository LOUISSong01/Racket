;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname pos) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))

;;******************************************************************
;;  Louis Song(20884386)
;;  Cs 135 Fall 2020
;;  Assignment 02, Question 4
;;******************************************************************
;;
;;
;;Question 4a
;;
;;
;;(change-due costs paid) produces the amount of change the customer
;;should receive back according to  the cost of products
;;and the amount of money customers paid

;;Examples :
(check-expect (change-due (costs (cons 3
                                       (cons 4 empty))) 3) 4)
(check-expect (change-due (costs
                           (cons 4(cons 3
                                        (cons 5 empty)))) 3) 9)
;;change-due : Num -> Num
;;Requires : costs => 0
;;paid => 0

(define (change-due costs paid) (- costs paid))

;;Tests :
(check-expect (change-due (costs
                           (cons 3.5 (cons 4.5
                                           (cons 1 empty)))) 3) 6)
(check-expect (change-due (costs
                           (cons 30 (cons 40
                                          (cons 50 empty)))) 2) 118)

;;(costs price) produces the total costs which is the costs of
;;individual prices of each item customers want to buy.

;;Examples :
(check-expect (costs (cons 4.8 (cons 3.5 empty))) (+ 8 (/ 3 10)))
(check-expect (costs (cons 3 empty)) 3)

;;costs :(listof Num) -> Num
;;Requires : costs => 0
(define (costs price)
  (cond[(empty? price) (error "No costs available")]
                [ (empty? (rest price)) (first price)]
                [ else (+ (first price) (costs(rest price)))]))
;;
;;
;;Question 4b
;;
;;
;;(paid-enough? costs paid) determines whether customers paid
;; enough money according to costs they need to pay.

;;Examples :
(check-expect (paid-enough?(costs
                            (cons 3 (cons 3.5 empty))) 100) true)
(check-expect (paid-enough?(costs
                            (cons 300 (cons 100 empty))) 3) false)


;;paid-enough? : (Num Num) -> Bool
;;Requires : costs => 0
;;paid => 0
(define (paid-enough? costs paid)
  (cond [(<= costs paid) true]
        [(> costs paid) false]))

;;Tests
(check-expect (paid-enough?(costs
                            (cons 304 (cons 4 empty))) 308) true)
(check-expect (paid-enough?(costs
                            (cons 0 (cons 4.9 empty))) 42) true)

;;
;;Question 4c
;;
;;
;;(free-item costs paid) identifies the price of an item if its price
;; set to be free, customers can cover the remaining costs.
;;Examples :

(check-expect(free-item
             (cons 30(cons 50 (cons 60 empty))) 70) 50)
                         
(check-expect(free-item
               (cons 300(cons 440 (cons 660 empty))) 730) 440)

;;free-item : (Listof Num Num) -> Num
;;Requires : costs => 0
;;paid => 0
;;paid-enough? = false (the customer has not provided enough
;;to cover the costs)

(define (free-item costs paid)
  (cond[(>= (first costs) (change-due (sum costs) paid))
        (first costs)]
       [else (free-item (rest costs) paid)]))

;;(sum price) produces the sum of total costs which is the costs of
;;individual prices of each item customers want to buy.

(check-expect (costs (cons 4.8 (cons 3.5 empty))) (+ 8 (/ 3 10)))
(check-expect (costs (cons 3 empty)) 3)

(define (sum price)
  (cond[(empty? price) (error "No costs available")]
                [ (empty? (rest price)) (first price)]
                [ else (+ (first price) (sum(rest price)))]))






 





