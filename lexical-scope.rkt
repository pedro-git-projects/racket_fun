#lang racket

; global environement
(define ten 10)
ten

((λ (x y) (+ (* 2 x) y)) 4 5) ; local values, the bindings of x and y exist only within the lambda expression

(let ([x 4]
	  [y 5])
  (+ (* 2 x ) y)) ; equivalent let expression that also only binds withing scope

#|
(let ([x 4]
	  [y 5]
	  [z( * 2 x)])
  (+ z y))
This will fail to work because x will be unbound outside the let expression and within (* 2 x)
|#

(let ([x 4]
	  [y 5])
  (let([z (* 2 x)]) ; the second let is inside the scope of the first, so this works
  (+ z y)))

