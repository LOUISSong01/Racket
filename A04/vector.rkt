;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname vector) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;******************************************************************
;;  Louis Song(20884386)
;;  Cs 135 Fall 2020
;;  Assignment 4 Question 2
;;******************************************************************
;;
;;Question 2a
;;
;;(euclidean-norm v) consumes a vector, v and produces corresponding
;;Euclidean Norm of v.
;;
;;Examples :
(check-within (euclidean-norm (list 3 4)) 5 0.01)
(check-within (euclidean-norm (list 1 3 5 6)) 8.43 0.01)
(check-within (euclidean-norm (list 0 0)) 0 0.01)

;;euclidean-norm : (listof Num) -> Num
;;requires : elements of v should be all numbers.

(define (euclidean-norm v)
  (sqrt (sum v)))

;;Tests :
(check-within (euclidean-norm (list -1 -2 -3 -4)) 5.48 0.01)

;;(sqr-list lst) consumes a list, lst and produces a list of
;;squared elements in the list.
;;
;;Examples :
(check-expect (sqr-list (list 1 2)) (list 1 4))
(check-expect (sqr-list empty) empty)

;;sqr-list : (listof Num) -> (list of Num)
;;requires : all elements of lst should be numbers.
(define (sqr-list lst)
  (cond [(empty? lst) empty]
        [else (cons (sqr(first lst))
                    (sqr-list (rest lst)))]))


;;(sum numlst) consumes a list, numlst and produces a sum of
;;squares of elements in the list.

;;Examples :
(check-expect (sum (list 1 2)) 5)
(check-expect (sum empty) 0)
(check-expect (sum (list 3 2)) 13)
(check-within (sum (list 1.5 2.4)) 8 0.01)

;;sum : (listof Num) -> Num
;;requires : all elements of numlst should be numbers.
(define (sum v)
  (cond [(empty? v) 0]
        [else (+ (first (sqr-list v))
                        (sum (rest v)))]))



;;Question 2b
;;
;;(unit-vector v) consumes a vector v and produces a unit vector of v
;;by dividing each component of v by v's Euclidean Norm

;;Examples :
(check-within (unit-vector (list 3 4)) (list 0.6 0.8) 0.01)
(check-within (unit-vector (list 4 8)) (list 0.45 0.9) 0.01)

;;unit-vector : (listof Num) -> (listof Num)
;;requires : v should be a vector with positive length and non-zero.

(define (unit-vector v)
  (cond [(empty? v) empty]
        [else (comp v (euclidean-norm v))]))

;;Tests :
(check-expect (unit-vector empty) empty)
(check-within (unit-vector (list -2 -1 -4))
                           (list -0.44 -0.22 -0.87) 0.01)



;;(comp alst e) consumes a list, alst and a number, e and divdes all
;;the elements in the alst by e and produces a corresponding list.

;;Examples :
(check-within (comp (list 4 8) 3) (list 1.33 2.67) 0.01)
(check-within (comp (list 5 8) 3) (list 1.67 2.67) 0.01)
;;comp : (listof Num) Num -> (listof Num)
(define (comp alst e) 
  (cond [(or (empty? alst) (empty? e)) empty]
        [else (cons (/ (first alst) e) (comp (rest alst) e))]))
;;
;;
;;Question 2c
;;
;;(cos-between a b) consumes two non-zero vectors a and b of positive
;;length, produces the cosine of the angle between a and b,which is
;;a dot product of two vectors.

;;Examples :
(check-within (cos-between (list 3 4) (list 0 6)) 0.8 0.01)
(check-within (cos-between empty empty) 0 0.01)

;;cos-between : (listof Num) (listof Num) -> Num
(define (cos-between a b)
  (cond [(or (empty? a) (empty? b)) 0]
        [else (/ (sum-product a b) (leng-product a b))]))

;;Tests :
(check-within (cos-between (list -1 -2) (list -2 -3)) 1.0 0.01)
(check-within (cos-between (list 0 -2) (list -2 0)) 0 0.01)

;;(product-lst lst1 lst2) consumes two vectors, lst1 and lst2 and
;;produces a list of products of elements from each list.
;;Examples :
(check-expect (product-lst (list 1 2) (list 2 4)) (list 2 8))
(check-expect (product-lst empty empty) empty)
(check-expect (product-lst (list 3 4) empty) (list 3 4))
(check-expect (product-lst empty (list 4 8)) (list 4 8))

;;product-lst : (listof Num) (listof Num) -> (listof Num)
(define (product-lst lst1 lst2)
  (cond [(empty? lst1) lst2]
        [(and (empty? lst1) (empty? lst2)) empty]
        [(empty? lst2) lst1]
        [(and (cons? lst1) (cons? lst2))
         (cons (* (first lst1) (first lst2))
               (product-lst (rest lst1) (rest lst2)))]))


;;(sum-product lst1 lst2) consumes two vectors, lst1 and lst2 and
;;produces sum of products of corresponding
;;degree of element in two vectors.
;;Examples :
(check-expect (sum-product (list 2 3) (list 3 4))18)
(check-expect (sum-product empty (list 3 4)) 0)
(check-within (sum-product
               (list 1.42 3.44) (list 4.2 3.4)) 17.66 0.01)


;;sum-product : (listof Num) -> Num
;;requires : lst1 and lst2 should be vectors with
;;positive length.
(define (sum-product lst1 lst2)
  (cond [(or (empty? lst1) (empty? lst2)) 0]
  [else (+ (first (product-lst lst1 lst2))
            (sum-product (rest lst1) (rest lst2)))]))


;;(leng-product vec1 vec2) consumes two vectors vec1 and vec2
;;and produces a product of length of two vectors vec1 and vec2.
;;Examples :
(check-within (leng-product (list 1 2) (list 3 4)) 11.18 0.01)
(check-within (leng-product (list 2 3) empty) 3.6 0.01)
(check-within (leng-product empty (list 4 5)) 6.4 0.01)
(check-within (leng-product empty empty) 0 0.01)


;;leng-product : (listof Num) (listof Num) -> Num
;;requires : vec1 and vec2 should be vectors with
;;positive length.
(define (leng-product vec1 vec2)
  (cond [(empty? vec1) (euclidean-norm vec2)]
        [(empty? vec2) (euclidean-norm vec1)]
        [(and (empty? vec1) (empty? vec2)) 0]
        [else (* (euclidean-norm vec1) (euclidean-norm vec2))]))









              







