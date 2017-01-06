#lang racket
(define (rm-fst-top sym lis)  ; need a symbol and a list as passing parameters
  (if (null? lis) '()
      (if (eq? sym (car lis))  (cdr lis)
          (cons (car lis)
                (rm-fst-top sym (cdr lis))
           )
       )
   )

 )
          