#lang racket

(define (oddpos l)
  (cond ( (null? l) '())
        ( (eq? (length l) 1) (display l))
        ( (cons (car l) (oddpos (cdr (cdr l)))))))

(define (evenpos l)
  (cond ( (null? l) '())
        ( (eq? (length l) 1) '())
        ( (cons (cadr l) (evenpos (cddr l))))))