#lang racket
(define (split ls)
  (if (or (null? ls) (null? (cdr ls)))
      (list ls '())
      (let ((next (split (cddr ls))))
        (list (cons (car ls) (car next))
              (cons (cadr ls) (cadr next))))))

; solution to problem 1
(define (oddfunc ls)
  (write (car ls)) ; (write (car (cdr ls))) for even position function
  (cond
  [(equal? (length ls) 2) '()]
  [(equal? (length ls) 1) '()]
  [(pair? ls) (oddfunc (cdr (cdr ls))) '()]))

;(define (duplicate ls)
 ; (write (cons (car ls) ls))
  ;(if (pair? ls) '() (duplicate (cdr (cdr ls)))))
;(define (duplicate ls)
 ; (for ([i ls])
  ;  (display (cons (car ls) ls))
   ; ))
; solution to program 2
(define (pass lst)
  (if (null? lst)
      '()
      (cons (car lst)
            (cons (car lst)
                  (pass (cdr lst))))))

; solution to program 3
(define (dp ls1 ls2)
  (if (eq? (length ls1) (length ls2))
      (if (eq? (length ls1) 0)
          0
          (+ (* (car ls1) (car ls2)) (dp (cdr ls1) (cdr ls2))))
      (display "length of two list are not equal"))
     )

;solution to program 4
(define l (list) )
;(define (lastless x ll)
 ; (if (null? ll)
   ;   (display "empty list")
  ;    (if (eq? x (car ll))
    ;      (write (remove x ll))
     ;     (if (list? (car ll))
      ;        (for ([i (car ll)])
       ;         (if (eq? x i)
        ;            (display (remove i ll))
         ;           0                    )
          ;      )
           ;;   (display (cons (car ll) (lastless x (cdr ll))))
             ; )
          ;)
      ;)
  ;)

(define (lless x ll)
    (if (eq? x (car ll)) (display (apply append (remove x ll) l)) (display (apply append (car ll) l)));(lless x (cdr ll))]
    (if (list? (car ll)) (for ([i (car ll)])
                        (if (eq? x i)
                            (display (apply append (remove i ll) l))
                            0)) (display (apply append (car ll) l)))
    (if (null? ll) 0 (lless x (cdr ll)))
    ;(display l)
    )
  