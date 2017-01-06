#lang racket
(define (rm-all sym lis)
  (cond ( (null? lis) '())
        ( (symbol? (car ll))
          (if (eq? sym (car ll)
                   (rm-all sym (cdr ll))
                   (cons (car ll)
                         (rm-all sym (cdr lis))))
           )
           (else (cons (rm-all sym (car ll))
                    (rm-all sym (cdr ll))
               )
            )

      )
 )
 )
                