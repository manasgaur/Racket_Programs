#lang racket
(define (duple l)
  (cond ( (null? l) '())
        ( (cons (cons (car l) (car l)) (duple (cdr l))))
        ( (list? l) (cons (cons (car l) (car l)) (duple (cdr l))))))
