#lang racket
(define v (vector "1" (+ 1 2)))

; making procedures in scheme
 ; study about it
; (apply <func> <list-of-args>)
(apply cons '(x (y z)))