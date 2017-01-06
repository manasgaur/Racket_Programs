#lang racket

(define (map fn lis)
  (if  (null? lis) '()
       (cons (fn (car lis))
             (map fn (cdr lis))
       )
   )
)

(foldr + 100 (list 2 4 8))
(foldr + 100 '(2 4 8))  ; reduce
(foldl * 100 (list 2 4 8))  ; accumulate
