#lang racket

(define-struct cost ($))
; generates code for make-cost and cost -$
; $ is the field

(define (totalcost cl)
  (if (null? cl) 0
      [+ (cost-$ (car cl))
         (totalcost (cdr cl))] ))

(define (totalcostHF cl)
  (foldr + 0 (map + 100 '(2 4 6))))
