;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname rrrr) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;;******************************************************************
;;  Louis Song(20884386)
;;  Cs 135 Fall 2020
;;  Mid-term Question 7
;;******************************************************************
;;
;;
;;(string->pirate word) consumes a string and replaces each
;;occurrences of the letter "a" with "arrr" and each occurrences
;;of the letter "A" with "Arrr"
;;
;;Examples :
(check-expect (string->pirate "na") "narrrr")
(check-expect (string->pirate "Waterloo") "Warrrrterloo")
(check-expect (string->pirate "Aarvark")"Arrrrarrrrrvarrrrrk")

;;string->pirate : Str -> Str
;;This is a wrapper function of (appending word)
(define (string->pirate word)
  (list->string(appending (string->list word))))

;;Tests :
(check-expect (string->pirate "APA")"ArrrrPArrrr")
(check-expect (string->pirate "BBB") "BBB")
(check-expect (string->pirate "a") "arrrr")


;;(apending letterlst) consumes a list of letters, letterlst
;;and converts a to arrrr and A to Arrrrr are strings.
;;
;;Examples :
(check-expect (appending (cons #\a (cons #\b empty)))
              (cons #\a
                    (cons #\r
                          (cons #\r
                                (cons #\r
                                      (cons #\r (cons #\b empty)))))))
;;appending : (listof Char) -> (listof Char)
;;Requires : all the elements in letterlst should be alphabets.
(define (appending letterlst)
  (cond [(empty? letterlst) empty]
        [(equal? (first letterlst) #\a)
         (cons #\a (cons #\r
                         (cons #\r
                               (cons #\r
                                     (cons #\r
                                           (appending
                                            (rest letterlst)))))))]
         [(equal? (first letterlst) #\A)
         (cons #\A (cons #\r
                         (cons #\r
                               (cons #\r
                                     (cons #\r
                                           (appending
                                            (rest letterlst)))))))]
        [else (cons (first letterlst) (appending (rest letterlst)))]))

;;Tests :
(check-expect(appending (cons #\a (cons #\a empty)))
(cons #\a
      (cons #\r
            (cons #\r
               (cons #\r
                   (cons #\r
                         (cons #\a
                              (cons #\r
                                    (cons #\r
                                        (cons #\r
                                            (cons #\r empty)))))))))))






