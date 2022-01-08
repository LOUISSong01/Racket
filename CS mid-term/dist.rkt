;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname dist) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;******************************************************************
;;  Louis Song(20884386)
;;  Cs 135 Fall 2020
;;  MT02 Question 4
;;******************************************************************
;;
;;question 4a
;;
;;(hamming-distance lst1 lst2) consumes two lists, lst1 and lst2
;; and produces the number of positions at which symbols differ.
;;
;;Examples
(define gene1 '(t a g a a g t t t))
(define gene2 '(t a g a a g g t t))
(check-expect (hamming-distance gene1 gene2) 1)

(define packet-a '(b a b a b a a a b a a a))
(define packet-b '(b a b a b b a a b a b b))
(check-expect (hamming-distance packet-a packet-b) 3)

;;hamming-distance : (listof Sym) (listof Sym) -> Nat
;;Requires : lst1 and lst2 should be list of symbols
(define (hamming-distance lst1 lst2)
  (cond [(or (empty? lst1) (empty? lst2)) 0]
        [else (+ (adding1 (first lst1) (first lst2))
                 (hamming-distance (rest lst1) (rest lst2)))]))
              
                 
 (define (adding1 sym1 sym2)
  (cond [(equal? (equal? sym1 sym2) false) 1]
        [else 0]))

;;Tests
(check-expect (hamming-distance empty empty) 0)
(check-expect (hamming-distance empty '(t s t t)) 0)
              
              
  