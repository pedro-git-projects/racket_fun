#lang racket

;;;;;;;;;;; Integers ;;;;;;;;;;;  

(+ 1 1)

(define int 12345678989)
(* int int int)
(- int)

(- 5 -7)
(/ 4 8) ; rational return
(/ 5) ; rational return 1/5

#b1011 ; binary integer
#b-10101 ; binary integer

#o666 ; octal 

#xadded ; hex

;;;;;;;;;;; Rationals ;;;;;;;;;;;  

-2/4

4/6

(+ 1/2 4/8) ; 1

(- 1/2 2/4 4/8 8/16) ; -1

(* 1/2 2/3) ; 1/3

(/ 2 2/3) ; 3

(numerator 2/3) ;2
(denominator 2/3) ;3

;;;;;;;;;;; Reals ;;;;;;;;;;;  

-3.14159

3.14e159

pi

-20e-2

;;;;;;;;;;; Complex ;;;;;;;;;;;  

+1i ; imagimary number
; 1i will error out

+i

-1-234i

(exact? 1/2+8/3i) ; because it has a rational part
(exact? 0.5+8/3i) ; because it has a floating point part

(real-part 1+2i) ; 1
(imag-part 1+2i) ; 2

;;;;;;;;;;; Numeric Comparision ;;;;;;;;;;;  

(= 1 1.0) ; #t

(= 1 2)

(= 0.5 1/2) ; #t

(< 1 2)

(<= 1 2)

(>= 2 1.9)

(< 1 2 3 4) ; #t 1 < 2, 2 < 3, 3 < 4
(< 1 2 4 3) ; #f

#|
	Mixing exact with exact will give an exact result.
	Mixing inexact with inexact will give an inexact result.
	Mixing exact with inexact (or vice versa) will give an inexact result. 
|#

(sqrt 25) ; returns exact integer

(sqrt 24) ; returns a floating point

(sqrt 1/4) ; returns a exact rational

(sqr 0.25) ; floating

(sqrt 1/4) ; rational

(sqrt -1) ; imaginary

; Exactness functions
(exact->inexact 1/3)

(inexact->exact pi)

; Test for type

(integer? 70) ; #t

(real? 70.0) ; #t

(complex? 70) ; #t because its imaginary part is zero

(integer? 70.0) ; #t because its fracional part is zero

(integer? 1.5) ; #f equivalent to 3/2

(rational? 1.5) ; #t

(rational? 1+5i) ; #f

(real? 2) ; #t

(complex? 1+2i) ; #t

; Mathematical functions

(abs -5)

(ceiling 1.5)

(ceiling 3/2)

(floor 1.5)

(tan (/ pi 4))

(atan 1/2)

(cos (* 2 pi))

(sqrt 81)

(sqr 4)

(log 100) ; natural logarithm

(log 100 10) ; base 10 logarithm

(exp 1) ; e^1

(expt 2 8) ; 2^8


; Infix notation 
; To achieve this we use the period operator 

(1 . >=  . 2)

(1 . + . 2)

; we can also add the infix pacakge using
; lang at-exp racket 
; (require infix)
