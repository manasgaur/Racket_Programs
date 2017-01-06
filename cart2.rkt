#lang racket

(define (cart2 x y)
  (if (null? x) '()
      (append (couple (car x) y)
              (cart2 (cdr x) y)
       )
   )

 )

(define (couple a y)
  (if (null? y) '()
      (cons (list a (car y))
            (couple a (cdr y))
      )
   )
 ) 