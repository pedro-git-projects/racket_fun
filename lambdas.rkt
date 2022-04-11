#lang racket

((λ(x y)(+ (* 2 x)y)) 4 5)
; 2 * 4 = 8
; 8 + 5 = 13

; equivalent way of computing this
(let ([x 4]
  	  [y 5])
	  (+(* 2 x)y))

; we can also assign anonymous functions to identifiers 
(define myFunc (λ (x y) (+(* 2 x)y)))
(myFunc 4 5)

; there is also the following shortcut
(define (shortFunc x y) (+ (* 2 x)y))
(shortFunc 4 5)

;;;;;;;;;;; Higher-Order Functions ;;;;;;;;;;;

(map (λ (x) (+ 1 x) '(1 2 3)))

(define my-add1 (λ (x)  (+ 1 x)))
(map my-add1 '(1 2 3))

(map + '(1 2 3) '(2 3 4)) ; 3 5 7

(+ 1 2 3 4) ; ok
; (+ '(1 2 3 4)) will error out due to type being list and not number
(apply + '(1 2 3 4)) ; apply takes a function and a list of arguments and applies to each said funciton
