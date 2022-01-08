;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname wild) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;;******************************************************************
;;  Louis Song(20884386)
;;  Cs 135 Fall 2020
;;  Mid-term Question 4
;;******************************************************************
;;
;;(waterloo-wildlife listSym) consumes a list of symbols and produces
;;the same list, but with 'emu and 'penguin removed.
;;
;;Examples :
(check-expect
 (waterloo-wildlife (cons 'apple
                          (cons 'candy
                                       (cons 'emu
                                             (cons 'water empty)))))
 (cons 'apple (cons 'candy (cons 'water empty))))

;;waterloo-wildlife : (listof Sym) -> (listof Sym)

(define (waterloo-wildlife listSym)
  (cond
    [(empty? listSym) empty]
    [else (cond
            [(or (equal? (first listSym)'emu)
                 (equal? (first listSym)'penguin))
                 (waterloo-wildlife (rest listSym))]
            [else (cons (first listSym)
                        (waterloo-wildlife (rest listSym)))])]))

;;Tests :
;;Tests whether every symbol eliminated when all of them are either
;;'penguin or 'emu
(check-expect
 (waterloo-wildlife (cons 'emu
                          (cons 'emu
                                    (cons 'emu
                                      (cons 'penguin empty)))))empty)

;;Tests whether empty list produces empty
(check-expect
 (waterloo-wildlife empty) empty)

             
                
     