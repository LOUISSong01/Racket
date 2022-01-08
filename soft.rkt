;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname soft) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;;******************************************************************
;;  Louis Song(20884386)
;;  Cs 135 Fall 2020
;;  Mid-term Question 5
;;******************************************************************
;;
;;question 5a
;;
;;(compute-norm lst) applies the exponential function,explist to
;;the list of numbers, lst and produce a sum of 
;;each element to produce normalization factor.

;;Examples :
(define test0 (cons 1.0 (cons 2.0 (cons -1.0 (cons 3.0 empty)))))
(check-within (compute-norm test0) 30.56 0.01)

;;compute-norm : (listof Num) -> Num
(define (compute-norm lst)
  (cond
    [(empty? lst) 0]
    [else (+ (first (explist lst)) (compute-norm (rest lst)))]))

;;(explist lstNum) consumes a list of real numbers, lstNum and
;;applies exponential function to each element in the list and
;;produces the corresponding list.
(define (explist lstNum)
  (cond
    [(empty? lstNum) empty]
    [else (cons (exp (first lstNum)) (explist (rest lstNum)))]))

;;As the question 5a indicated, there is no other tests 
;;required except the one above.
;;
;;question 5b
;;
;;(apply-norm norm lst) applies the exponential function eplist to
;;the list of numbers, lst and divide each element
;;in the list by norm

;;Examples :
(check-within (first (apply-norm 30.56 test0)) 0.09 0.01)
;;apply-norm : Num (ListofNum) -> Num
;;Requires : Norm should not be equal to zero
(define (apply-norm norm lst)
  (cond
    [(empty? lst) empty]
    [else (cons (/ (first (explist lst)) norm)
                (apply-norm norm (rest lst)))]))

;;Tests
(check-within (first (rest (apply-norm 30.56 test0))) 0.24 0.01)
;;
;;question 5c
;;
;;(softmax numlst) consumes a non-empty list of numbers, numlst and
;;produces the list of softmax of each element in the list

;;Examples :
(check-within (first (softmax test0)) 0.09 0.01)
(check-within (first(rest (rest (softmax test0)))) 0.012 0.01)


;;softmax : (listofNum) -> Num
;;Requires : numlst should be not empty.

(define (softmax numlst)
  (cond [(empty? numlst) empty]
  [else (cons (first (apply-norm (compute-norm numlst) numlst))
              (softmax (rest numlst)))]))

;;Tests :
(check-within (first(rest (rest (softmax test0)))) 0.012 0.01)




