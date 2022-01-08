;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |short answer help|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (decreasing-v2? numlist)
  (cond
    [(empty? numlist) true]
    [(empty? (rest numlist)) true]
    [else (and (> (first numlist) (second numlist))
               (decreasing-v2? (rest numlist)))]))

(define (decreasing-v3? numlist)
  (cond
    [(empty? numlist) true]
    [(empty? (rest numlist)) true]
    [(<(first numlist) (second numlist)) false]
    [(> (first numlist) (second numlist))
     (decreasing-v3? (rest numlist))]))

(define (dedupe-v2 lst)
  (cond
    [(empty? lst) empty]
    [(member? (first lst) (dedupe-v2 (rest lst)))
     (dedupe-v2 (rest lst))]
    [(not (member? (first lst) (dedupe-v2 (rest lst))))
     (cons (first lst) (dedupe-v2 (rest lst)))]))

(define (dedupe-v3 lst)
  (cond
    [(empty? lst) empty]
    [(member? (first lst) (dedupe-v3 (rest lst)))
     (dedupe-v3 (rest lst))]
    [else (cons (first lst) (dedupe-v3 (rest lst)))]))
