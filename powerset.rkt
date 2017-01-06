#lang racket
(define (powerset s)
  (if (null? s) '(())
      (append (ins (car s)
                   (powerset (cdr s))
               )
               (powerset (cdr s))
       )
   )
 )

(define (ins a ss)
  (if (null? ss) '()
      (cons (cons a (car ss))
            (ins a  (cdr ss))
      )
   )
 )
      