;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |2|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;******************************************************************
;;  Louis Song(20884386)
;;  Cs 135 Fall 2020
;;  A05 Question 2
;;******************************************************************
(define-struct grocery (dept name cost mass))
;; A Grocery is a (make-grocery Str Str Num Num)
;; Requires: cost >= 0, mass > 0.
;; A Store is a (listof Grocery)
;; Requires: no two items have both the same dept and same name.
;;
;;question 2a
;;
;;
;;(student-shop) is a constant that indicates a list of
;;products in a market and their information of my own market.
(define student-shop
(list (make-grocery "seed" "almond" 2.31 150)
(make-grocery "can" "tuna" 4.00 650)
(make-grocery "seed" "pinto" 2.49 500)
(make-grocery "produce" "pear" 3.14 580)
(make-grocery "can" "creamed eels" 2.58 490)
(make-grocery "produce" "pineapple" 3.17 820)
(make-grocery "produce" "mango" 3.24 850)
(make-grocery "produce" "grape" 3.17 820)
(make-grocery "can" "corn" 4.00 400)
(make-grocery "seed" "wheat" 0.48 700)))
;;(try-n-save) is a constant that indicates a list of
;;products and their information in a market, try-n-save
(define try-n-save
(list (make-grocery "produce" "apple" 2.49 600)
(make-grocery "seed" "rice" 0.95 1000)
(make-grocery "dairy" "milk" 3.99 4000)
(make-grocery "seed" "pinto" 2.49 500)
(make-grocery "produce" "potato" 2.99 5000)
(make-grocery "chips" "potato" 1.99 250)
(make-grocery "chips" "corn" 1.99 275)
(make-grocery "seed" "wheat" 0.49 500)
(make-grocery "produce" "banana" 0.69 450)
(make-grocery "dairy" "cheese" 6.49 900)
(make-grocery "chips" "banana" 1.99 50)
(make-grocery "produce" "peach" 3.99 400)
(make-grocery "seed" "lentil" 2.99 800)
(make-grocery "produce" "corn" 0.99 100)))
;;(kwik-e-mart) is a constant that indicates a list of
;;products and their information in a market, kwik-e-mart
(define kwik-e-mart
(list (make-grocery "seed" "rice" 0.38 400)
(make-grocery "can" "corn" 4.00 400)
(make-grocery "seed" "pinto" 2.49 500)
(make-grocery "produce" "apple" 2.99 400)
(make-grocery "can" "creamed eels" 2.19 350)
(make-grocery "produce" "pineapple" 3.17 250)))
;;
;;
;;
;;question 2b
;;
(define-struct interval (lo hi))
;; An Interval is a (make-interval (anyof 'dontcare Num)
;; (anyof 'dontcare Num))
;;
;;(in-interval? Num Interval) consumes a number, Num and
;;a certain interval, Interval and produces a boolean 
;;value of true when it's in the interval, Interval otherwise false.
;;
;;Examples
;;
(check-expect (in-interval? 42
(make-interval 'dontcare 'dontcare)) true)
(check-expect (in-interval? 34
(make-interval 35 'dontcare)) false)
(check-expect (in-interval? 34
(make-interval 'dontcare 35)) true)

;;in-interval : Num Interval -> Bool
(define (in-interval? Num Interval)
  (cond [(or (empty? Num) (empty? Interval)) false]
        [(and (equal? (interval-lo Interval) 'dontcare)
              (equal? (interval-hi Interval) 'dontcare)) true]
        [(equal? (interval-lo Interval) 'dontcare)
              (cond [(and (number? (interval-hi Interval))
                          (<= Num (interval-hi Interval))) true]
                    [else false])]
        [(equal? (interval-hi Interval) 'dontcare)
              (cond [(and (number? (interval-lo Interval))
                          (>= Num (interval-lo Interval))) true]
                    [else false])]
        [(and (number? (interval-lo Interval))
              (number? (interval-hi Interval)))
         (cond[(and (<= Num (interval-hi Interval))
                    (>= Num (interval-lo Interval))) true]
              [else false])]))

;;Tests :
(check-expect (in-interval? empty empty) false)
(check-expect (in-interval? 34
(make-interval 'dontcare 27)) false)
(check-expect (in-interval? 34
(make-interval 26 'dontcare)) true)
(check-expect (in-interval? 27
(make-interval 26 28)) true)
(check-expect (in-interval? -4.5
(make-interval -6 -5)) false)
;;
;;
;;question 2c
;;
(define-struct query (dept name cost mass))
;; A GroceryQuery is a
;; (make-query StrPatt StrPatt Interval Interval)
;;
;; A StrPatt is a (anyof Str 'dontcare)
;;
;;;; A Grocery is a (make-grocery Str Str Num Num)
;; Requires: cost >= 0, mass > 0.
;;
;;(find-matches listGrc GrocQ) consumes a list of Grocery,
;;listGrc and a GroceryQuery and produces a list of items
;;from the list that satisfy conditions in GroceryQuery.
;;
;;Examples :
(check-expect
(find-matches try-n-save (make-query "seed" 'dontcare
(make-interval 'dontcare 'dontcare)
(make-interval 'dontcare 'dontcare)))
(list
(make-grocery "seed" "rice" 0.95 1000)
(make-grocery "seed" "pinto" 2.49 500)
(make-grocery "seed" "wheat" 0.49 500)
(make-grocery "seed" "lentil" 2.99 800)
(make-grocery "seed" "corn" 4.99 850)))


;;find-matches : (listof Grocery) GroceryQuery
;; -> (listof Grocery)
(define (find-matches listGrc GrocQ)
  (cond [(or (empty? listGrc) (empty? GrocQ)) empty]
        [(equal? (in-dept? (first listGrc) GrocQ) true)
                   (cons (first listGrc)
                         (find-matches (rest listGrc) GrocQ))]
        [else (find-matches (rest listGrc) GrocQ)]))


;;(in-dept? gro query) consumes a Grocery,gro and
;;query and check whether their dept part are equal
;;or not.
;;Examples :
(check-expect (in-dept?
             (make-grocery "seed" "rice" 0.95 1000)
             (make-query 'dontcare "corn" 'dontcare 'dontcare) true)) 
                        
;;in-dept? : Grocery query -> Bool
(define (in-dept? dept lstGrc)
(or (equal? (grocery-dept dept) (query-dept queryGrc))
    (equal? 'dontcare (query-dept queryGrc))))

(define (







