#lang racket 

; everything that is  not false is true!
(not #t) ; #f
(not #f) ; #t
(not 5) ; #f

(and #t #f)
(and 'apples #f) ; #t
(and (equal? 5 5) #f) ; #f
(and (equal? 5 5) #t) ; #t

; if no #f is encouterd racket will return the value of its last argument
(and (equal 5 5) #t 23) ; 23 

(or #f #f)  ; #f
(or #f #t) ; #t
; the first true is returned
(or #f 45 (= 1 3)) ; 45
