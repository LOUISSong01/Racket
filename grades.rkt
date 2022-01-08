;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname grades) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;;******************************************************************
;;  Louis Song(20884386)
;;  Cs 135 Fall 2020
;;  Assignment 02, Question 3
;;******************************************************************

;;(cs135-grade self-check assign mt1 mt2 final) produces the final
;;cs135-grade out of 100 according to self-check,
;;assign,mt1,mt2,and final grades

;;Examples:
(check-expect(cs135-grade 0.8 0.5 0.9 0.7 0.65) 59.6)
(check-expect(cs135-grade 0.8 0.7 1.0 0.6 0.85) 74.8)

;;A NumGrade is Num in the range [0, 1] representing
;;a decimal form of grade in CS135.

;;cs135-grade : (listof NumGrade) -> NumGrade

(define (cs135-grade self-check assign mt1 mt2 final)
  (cond [(or (< assign 0.5) (< (exam mt1 mt2 final) 0.5)) 46]
        [else (+(* self-check 10) (* assign 60)
                (* (exam mt1 mt2 final) 30))]))

;;Tests:
(check-expect (cs135-grade 0.8 0.6 0.4 0.9 0.95) (+ 68 (/ 3 10)))
(check-expect (cs135-grade 0.3 0.5 0.6 0.5 0) 46)
(check-expect (cs135-grade 0.2 0.6 0.6 0.6 0.7) (+ 57 (/ 3 5)))

;;(exams mt1 mt2 final) produces the
;;decimal form of grade of exam portion of CS135 according to
;;mt1, mt2, and final grade

;;Examples :
(check-expect (exam 1.0 1.0 1.0) 1.0)
(check-expect (exam 0.5 0.6 0.7) 0.63)

;;exam : (list of NumGrade) -> NumGrade

(define (exam mt1 mt2 final)
  (/ (+ (* mt1 7) (* mt2 7) (* final 16)) 30))




