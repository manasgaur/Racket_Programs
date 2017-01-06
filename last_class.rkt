#lang racket
; why we need apply function?
; apply is to unify functions with different arities.
; arity : number of parameters
; "apply" is a defined function


; Anonymous Function
; (lambda <formals-list> <body-expr>)

((lambda (n) (+ n 2)) (+ 1 4))

; evaluating the body expression means static scoping

(define mul
  (lambda x
    (if (null? x)
        1
        (* (car x)
           (apply mul
                  (cdr x))
           )
        ))
  )
; (mul 2 (+ 2 2 ) 5) : this expression when passed to above function converts
; into (mul 2 4 5) where 2,4,5 is a list
; empty is identity to append

; LET constructs allows you local bindings
(define y 5)
(let ( (y 7) (x y) ) x)
(let ( (y 7) ) (let ( (x y) ) x) )
; behaviour of let * is analogous to behaviour of nested Let
(let * ( ( y 7 ) (x y) ) x )
; making let recursive (letrec)
; letrec is more painful for running on interpreter