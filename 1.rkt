;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; A StudentID is a Nat with at most 8 digits
;;(i.e. 0 <= id <= 99999999)
;; A Grade is one of:
;; * false
;; * Nat
;; Requires: Nat is between 0 and 100 (inclusive)
(define-struct student (id name grade))
;; A Student is a (make-student StudentID Str Grade)

(define-struct rnode (student left right))
;; A Roster Node (RN) is a (make-rnode Student Roster Roster)
;; Requires: all students in the
;;left subtree have an ID < student's ID
;; all students in the right subtree have an ID > student's ID
;; A Roster is one of
;; * empty
;; * RN

(define beth (make-student 12345678 "Beth" 96))
(define jenny (make-student 08675309 "Jenny" 81))
(define john1 (make-student 48975311 "John" 95))

(define sample-roster
(make-rnode beth ; root
(make-rnode jenny empty empty) ; left child
(make-rnode john1 empty empty))) ; right child
;;
;; beth
;; / \
;; jenny john1

(define jenny/new (make-student 08675309 "Jen" 81))
(define john2 (make-student 20488192 "John" false))

(define sample-roster-2
(make-rnode beth
(make-rnode jenny/new empty empty)
(make-rnode john1
(make-rnode john2 empty empty)
empty)))

;;
;;
;;question 1a
;;
;;(find-student StudentID Roster) consumes StudentID and Roster to
;;produce the matching student.
;;
;;Example
(check-expect (find-student 12345678 sample-roster) beth)
(check-expect (find-student 87654321 sample-roster) false)


;;find-student : StudentID BT -> (Anyof Str BT)
(define (find-student StudentID Roster)
  (cond [(empty? Roster) false]
        [(equal? StudentID
          (student-id(rnode-student Roster))) (rnode-student Roster)]
        [(< StudentID (student-id(rnode-student Roster)))
         (find-student StudentID (rnode-left Roster))]
        [(> StudentID (student-id(rnode-student Roster)))
         (find-student StudentID (rnode-right Roster))]))
;;Tests:
(check-expect (find-student 10000000 sample-roster) false)
(check-expect (find-student 1923921 empty) false)
(check-expect (find-student 08675309 sample-roster) jenny)
;;
;;
;;question 1b
;;
;;(class-average Roster) consumes Roster and
;;produces the class-average.
;;
;;Examples
(check-expect (class-average sample-roster) (+ 90 2/3))
(check-expect (class-average sample-roster-2) (+ 90 2/3))
(check-expect (class-average empty) 'N/A)

;;class-average : BT -> (anyof false N/A Num)
(define (class-average Roster)
  (cond [(empty? Roster) 'N/A]
        [else (/ (sum (student-grade (rnode-student Roster))) 
         
(define (sum lst)
  (cond [(empty? lst) 0]
        [else (+ (first lst) (sum (rest lst)))]))
     

          
  
