#lang racket
;(define nl (list))
; program for ptyper
(define (ptyper l)
  (cond ( (null? l) '())
        ( (empty? (car l)) (cons (car l) (ptyper (cdr l))))
        ( (number? (car l)) (cons 'n (ptyper (cdr l))))
        ( (symbol? (car l)) (cons 's (ptyper (cdr l))))
        ( (list? (car l)) (cons (ptyper(car l)) (ptyper (cdr l))))
        ( (string? (car l)) (cons (car l) (ptyper (cdr l))))
        (else (cons (car l) (ptyper (cdr l))))))