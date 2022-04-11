#lang at-exp racket
(require infix)

; lang allows us to define language extensions
; in this case to use @-expressions

; with the infix packages instead of writing:
($ "1+2*3")

; we can write
@${1 + 2 * 3}

; syntax for functions
@${1 + 2 * sin[pi/2]}

; syntax for lists
@${{1, 2, 1+2}}

; := is equivalent to set!
(define a 5)
@${a^2}

@${a := 6}
@${2*a + 7}

(define (quad a b c)
  (let ([d 0])
    @${ d := sqrt[b^2 - 4 * a * c];
       {(-b + d) / (2*a), (-b - d)/(2*a)}}))

@${quad[2, -8, 6]}
(quad 2 -8  6)
