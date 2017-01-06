#lang racket

; PROGRAM 1

; CONTRACT : oddpos : list  list -> list
; PURPOSE : oddpos takes a list as an argument and returns a list contaning
;           numbers in the odd position
; CODE:
;(display "output of PROGRAM 1 odd")
(define (oddpos l)
  (cond ( (null? l) '())
        ( (eq? (length l) 1) (display l))
        ( (cons (car l) (oddpos (cdr (cdr l)))))))

; CONTRACT : evenpos : list  list -> list
; PURPOSE : evenpos takes a list as an argument and returns a list contaning
;           numbers in the even position
;CODE:
;(display "output of PROGRAM 1 even")
(define (evenpos l)
  (cond ( (null? l) '())
        ( (eq? (length l) 1) '())
        ( (cons (cadr l) (evenpos (cddr l))))))


; PROGRAM 2

; CONTRACT : duplicate : list  list -> list
; PURPOSE :  duplicate takes a list as input and duplicate each element in the
;            list. Element can be a literal or a nested list
; CODE:
;(display "output of PROGRAM 2")
(define (duplicate l)
  (cond ( (null? l) '())
        ( (cons (cons (car l) (car l)) (duplicate (cdr l))))
        ( (list? l) (cons (cons (car l) (car l)) (duplicate (cdr l))))))



; PROGRAM 3

; CONTRACT : dotproduct : list1, list2  (list1,list2) -> number
; PURPOSE : dotproduct takes two lists as input and calculate the dot product.
;           A dotproduct is the summation of product of two elements, one from
;           list1 and other from list2
; CODE:
;(display "output of PROGRAM 3")
(define (dotproduct ls1 ls2)
  (if (eq? (length ls1) (length ls2))
      (if (eq? (length ls1) 0)
          0
          (+ (* (car ls1) (car ls2)) (dotproduct (cdr ls1) (cdr ls2))))
      (display "*incompatible*"))
     )


; PROGRAM 4

; CONTRACT: lastless : list, sub-list (list,sub-list) -> list
; PURPOSE : lastless takes a list and sub-list as input and return a list which does not contain occurrences of the elements in the sub-list
; CODE:
(define (membership? lst e)
  (if (null? lst)
      (eq? lst e)
      (if (list? (car lst))
          (membership? (append (car lst) (cdr lst)) e)
          (if (eq? (car lst) e)
              (eq? (car lst) e)
              (membership? (cdr lst) e)))))

(define (lastless lst e)
  (if (null? lst) '()
      (if (list? (car lst))
          (if (membership? (cdr lst) e)
              (cons (car lst) (lastless (cdr lst) e))
              (cons (lastless (car lst) e) (cdr lst)))
          (if (eq? (car lst) e)
              (if (membership? (cdr lst) e)
                  (cons (car lst) (lastless (cdr lst) e))
                  (cdr lst))
              (cons (car lst) (lastless (cdr lst) e))))))


; PROGRAM 5

; CONTRACT : ptyper : list list -> list
; PURPOSE : ptyper takes a list as input and replaces symbols by "s" and numbers
;           by "n" and returns the modified list
; CODE:
;(display "output of PROGRAM 5")
(define (ptyper l)
  (cond ( (null? l) '())
        ( (empty? (car l)) (cons (car l) (ptyper (cdr l))))
        ( (number? (car l)) (cons 'n (ptyper (cdr l))))
        ( (symbol? (car l)) (cons 's (ptyper (cdr l))))
        ( (list? (car l)) (cons (ptyper(car l)) (ptyper (cdr l))))
        ( (string? (car l)) (cons (car l) (ptyper (cdr l))))
        (else (cons (car l) (ptyper (cdr l))))))



; PROGRAM for binary search tree EOPL 1.17 1

; CONTRACT : path : number, list  (number, list) -> list
; PURPOSE : path takes a a number and a binary search tree in the form of list.
;           The function finds the number in the binary search tree and return
;           a list containing the direction of traversal in order to find the 
;           number in binary search tree
; CODE:
;(display "output of PROGRAM EOPL 1.17 1")
(define labels '("left" "right"))
(define root 0)
(define (path n bst)
  (if (null? bst) ('())
      (if (number? bst) (display bst)
          (if (eq? n (car bst)) 0
              (if (> n (car bst)) (cons (list-ref labels 1) (path n (caddr bst)))
                  (cons (list-ref labels 0) (path n (cadr bst))))))))


(define (remove l e)
  (cond ( (null? l) '() )
        ( (= (car l) e) (cdr l))
        (else (cons (car l) (remove (cdr l) e)))))

(define (smallest l e)
  (cond ( (null? l) e)
        ( (< (car l) e) (smallest (cdr l) (car l)))
        (else (smallest (cdr l) e))))

(define (greatest l e)
    (cond ( (null? l) e)
          ( (> (car l) e) (greatest (cdr l) (car l)))
          (else (greatest (cdr l) e))))


; PROGRAM for increasing order EOPL 1.17 2

; CONTRACT : sorti : list  list -> list
; PURPOSE : sorti takes a list contains a number in unsorted format and returns
;           a list containing number in increasing order
; CODE:
;(display "output of PROGRAM EOPL 1.17 2")
(define (sorti l)
  (cond ( (null? l) '())
        ( else (cons (smallest l (car l))
                     (sorti (remove l (smallest l (car l))))))))

; PROGRAM for "Predicate", EOPL 1.17 3

; CONTRACT : predicate: literal, list  (literal,list) -> list
; PURPOSE : predicate takes a literal and list as arguments. Literal tell about
;           the order in which the unsorted list has to be sorted and the function
;           return the sorted list
; CODE:
(define (sortd l)
  (cond ( (null? l) '())
        ( else (cons (greatest l (car l))
                     (sortd (remove l (greatest l (car l))))))))

;(display "output of PROGRAM EOPL 1.17 3")
(define (sort predicate l)
  (cond ( (null? l) '())
        ( (eq? predicate '>) (sortd l))
        ( (eq? predicate '<) (sorti l))
        (else (display "unrecognized predicate"))))


; EXAMPLES tested
(oddpos '(a b c d))
(oddpos '(a))
(evenpos '(a b c d))
(evenpos '(a))


(duplicate '(a 1 b 2 c 3))
(duplicate '((a 1) b ((c)) 2))

(dotproduct '(1 2 3) '(4 5 6))
(dotproduct '(1 2 3) '(4 5))

(lastless '(a b a (c e) d) 'e)

(ptyper '(2 (abc () (#t f) "abc")))

(path 17 '(14 (7 () (12 () ())) (26 (20 (17 () ()) ()) (31 () ()))))

(sorti '(8 2 5 2 3))

(sort '< '(8 2 5 2 3))
(sort '> '(8 2 5 2 3))



