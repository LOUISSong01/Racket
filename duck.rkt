;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname duck) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;;******************************************************************
;;  Louis Song(20884386)
;;  Cs 135 Fall 2020
;;  Mid-term Question 3
;;******************************************************************
;;
;;question 3a
;;
;;These constants sm-bound and lar-bound are used for indicating
;;bounds for small animals and large animals.
(define sm-bound 500)
(define lar-bound 10000)

;;(animal-size weight) consumes the animal's weight and categorizes
;;it into either 'small, 'medium, or 'large.
;;
;;Examples :
(check-expect (animal-size 20000) 'large)

;;animal-size : Nat -> Sym
;;Requires : weight => 0
(define (animal-size weight)
  (cond
    [(< weight sm-bound) 'small]
    [(> weight lar-bound) 'large]
    [else 'medium]))
;;Tests :
(check-expect (animal-size 0) 'small)
(check-expect (animal-size 501) 'medium)
(check-expect (animal-size 15000) 'large)
;;
;;question 3b
;;
;;(goose? swims? flies? angry? weight) determines if an animal is
;;goose based on its traits.
;;
;;Examples :
(check-expect (goose? true true true 10000000) true)

;;goose? : Bool Bool Bool Nat -> Bool
;;Requires : weight => 0
(define (goose? swims? flies? angry? weight)
  (cond
    [(and (equal? swims? true)
          (equal? flies? true)
          (equal? angry? true)
          (equal? (animal-size weight) 'large)) true]
  [else false]))

;;Tests :
(check-expect (goose? false false true 123211) false)
(check-expect (goose? true true true 0) false)
;;
;;question 3c
;;
;;(what-animal swims? flies? angry? weight) identifies which wildlife
;; we might see based on the wildlife's traits
;;
;;Examples :
(check-expect (what-animal true true false 600) 'duck)
(check-expect (what-animal false false false 10011001) 'emu)

;;what-animal : Bool Bool Bool Nat -> Sym
;;Reqruies : weight > 0
(define (what-animal swims? flies? angry? weight)
  (cond [(and (equal? swims? true)
              (equal? flies? true)
              (equal? angry? false)
              (equal? (animal-size weight) 'medium))'duck]
        [(and (equal? swims? true)
              (equal? flies? true)
              (equal? angry? true)
              (equal? (animal-size weight) 'large))'goose]
        [(and (equal? swims? true)
              (equal? flies? true)
              (equal? angry? true)
              (or(equal? (animal-size weight) 'medium)
                 (equal? (animal-size weight) 'small))) 'duck]
        [(and (equal? swims? true)
              (equal? flies? false)) 'penguin]
        [(and (equal? swims? false)
              (equal? flies? true)
              (or(equal? (animal-size weight) 'medium)
                 (equal? (animal-size weight) 'large))) 'crow]
        [(and (equal? swims? false)
              (equal? flies? true)
              (equal? (animal-size weight) 'small)) 'sparrow]
        [(and (equal? swims? false)
              (equal? flies? false)
              (equal? (animal-size weight) 'small)) 'squirrel]
        [(and (equal? swims? false)
              (equal? flies? false)
              (or(equal? (animal-size weight) 'medium)
                 (equal? (animal-size weight) 'large))) 'emu]
        [else 'unidentifed]))

;;Tests : 
(check-expect(what-animal true false true 120301230301) 'penguin)


        
  

