;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname cold) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;;******************************************************************
;;  Louis Song(20884386)
;;  Cs 135 Fall 2020
;;  Mid-term Question 6
;;******************************************************************
;;
;;
(define lowbound 8);a person gets 'sad as hightemp goes below this
(define highbound 20);a person gets 'happy as hightemp goes above this
;;
;;(weather hightemp) consumes a list of the
;;predicted high temperatures,
;;hightemp and categorize weather into one of 'happy,'okay,or 'sad
;;based on the temperatures.

;;Examples :
(define test0 (cons 15.0 (cons 22.0
                               (cons -273.15 (cons 20.0 empty)))))
(check-expect (weather test0) 'sad)
(define test1 (cons 8.0 (cons 12.0
                              (cons 35.0 (cons 9.0 empty)))))
(check-expect (weather test1) 'happy)

;;weather : (listof Num) -> Sym
(define (weather hightemp)
    (cond [(empty? hightemp) 'okay]
          [(<= 1 (sad-temp hightemp)) 'sad]
          [(and (= 0 (sad-temp hightemp))
                (<= 1 (happy-temp hightemp))) 'happy]
          [else 'okay]))

;;Tests :
(define test2 (cons -0.1 (cons 21 (cons 8 (cons -4 empty)))))
(check-expect (weather test2) 'sad)
(define test3 empty)
(check-expect (weather test3) 'okay)
(define test4 (cons 9 (cons 10 (cons 12 empty))))
(check-expect (weather test4) 'okay)

;;(sad-temp ListTemp) consumes a list of temperatures, ListTemp and
;;counts how many days have more than one day where high temperatuere
;; is below 8

;;Examples :
(check-expect (sad-temp (cons 3 (cons 8 (cons 4 empty)))) 2)

(define (sad-temp listTemp)
  (cond
    [(empty? listTemp) 0]
    [(< (first listTemp) lowbound) (+ 1 (sad-temp (rest listTemp)))]
    [else (sad-temp (rest listTemp))]))
;;Tests :
(check-expect (sad-temp (cons 0 (cons 0 (cons 0 empty)))) 3)

;;(happy-temp ListTemp) consumes a list of temperatures, ListTemp and
;;counts how many days have more than one day where high temperatuere
;; is above 20

;;Examples :
(check-expect (happy-temp (cons 9 (cons 31 (cons 42 empty)))) 2)

(define (happy-temp listTemp)
  (cond
    [(empty? listTemp) 0]
    [(> (first listTemp) highbound)
     (+ 1 (happy-temp (rest listTemp)))]
    [else (happy-temp (rest listTemp))]))

;;Tests :
(check-expect (happy-temp (cons 0 (cons 1 (cons 21 empty)))) 1)