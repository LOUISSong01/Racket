;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mean-relative) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;;******************************************************************
;;  Louis Song(20884386)
;;  Cs 135 Fall 2020
;;  Assignment 02, Question 6
;;******************************************************************
;;
;;(mean-relative Intlst) consumes a list of integers and
;;produces a list of symbols showing either integers in
;; Intlst is 'below-mean, 'above-mean, or 'mean(exactly mean)

;;Examples :
(check-expect((mean-relative
              (cons 5 (cons 6 (cons 5 empty)))))
              (cons 'below-mean
                    (cons 'above-mean(cons 'below-mean empty))))

(check-expect((mean-relative
              (cons 4 (cons 4 (cons 5 empty)))))
              (cons 'below-mean
                    (cons 'below-mean(cons 'above-mean empty))))

(define (mean-relative Intlst)
  (cond [(empty? Intlst) empty]
        [(< (first Intlst) (mean Intlst)) (cons 'below-mean empty)]
        [(= (first Intlst) (mean Intlst)) (cons 'mean empty)]
        [(> (first Intlst) (mean Intlst)) (cons 'above empty)]
        [else (add-item-each (mean-relative
                              (first Intlst)) (rest Intlst))]))

;;Tests :
(check-expect((mean-relative
              (cons 5 (cons 5 (cons 5 empty)))))
             (cons 'mean
                    (cons 'mean(cons 'mean empty))))

;;(add-item-each item lon) adds the first value of the list
;;to each item in the list.
             
(define (add-item-each item lon)
	(cond [(empty? lon) empty ]
[else (cond ((+ item (first lon)) (add-item-each item (rest lon))))]))

(define (add-first-each lon)
    (add-item-each (first lon) lon))


;;(mean Intlst) gets the mean value of the following lists.

(define (mean Intlst) (/(sum Intlst)(length Intlst)))

;;(sum Int) gets the sum of the values in the following lists.
(define (sum Int)
  (cond[(empty? Int) (error "No calculation available")]
                [ (empty? (rest Int)) (first Int)]
                [ else (+ (first Int) (sum(rest Int)))]))
