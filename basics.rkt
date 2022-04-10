#lang racket

; Creating a list of numbers
(list 1 2 3)

; Lists can be nested
(list 1(list "two" "three") 4 5)

; Quoted vs Unquoted lists
(quote(3 1 4 pi))
(list 3 1 4  pi)

; S-expressions:
; 1: atoms
; 2: (x . y) such that x and y are s-expressions

; Creating pair nodes or cons cells
(cons 1 2) ; pair
(cons 1 '()) ;list

; Testing wheter an expression is a pair or a list
(pair? (cons 1 2))
(list? (cons 1 2))
(pair? (cons 1 '()))
(list? (cons 1 '()))
; A list is always a pair, but a pair is not always a list

; first and rest are analogous to car and cdr respectively, but they only work on lists
(car '(1 ("two" "three") 4 5 ))
(first '(1 ("two" "three") 4 5))
(cdr '(1 ("two" "three") 4 5 ))
(rest '(1 ("two" "three") 4 5))

; There are also the second and third functions
(first '(1 2 3 4))
(second '(1 2 3 4))
(third '(1 2 3 4))

; We can also extract arbitrary postitions via list-ref
; it is a 0-based index function that takes the list and the position
(list-ref '(a b c) 0)
(list-ref '(a b c) 1)

#|------------- Useful List Functions ---------------|#
(length '(1 2 3 4 5))

(reverse '(1 2 3 4 5))

(sort '(1 3 4 6 7 8 9 2)<) ; ascending sort
(sort '(1 3 4 6 7 8 9 2)>) ; descending sort

(append'(1 2 3)'(4 5 6))
(append '(1 2) '(3 4) '(5 6)) ; appending works on an arbitrary number of arguments

(range 0 10 2) ; start value - end value - step
(range 10) ; it will start from 0 with a setp of 1

(make-list 10 'pedro) ; making a list with the make list function

(null? '()) ; testing for empty lists

(index-of '(8 7 1 9 5 2) 9) ; gets the index of the passed value
(index-of '(8 7 1 9 5 2) 50) ; returns #f if it is not found 

(member 7 '(9 3 5 (6 2) 5 1 4)) ; returns #f if the element is not present
(member 5 '(9 3 5 (6 2) 5 1 4)) ; returns the tail expression starting with the element if it matches 
(member 6 '(9 3 5 (6 2) 5 1 4)) ; notice it does not work on sublists if you dont pass as so 
(member '(6 2) '(9 3 5 (6 2) 5 1 4)) 

#|------------- Variables ---------------|#
(define a 123) ; define binds 123 to a
a
(define b '(123))
b

; parallel binding
(define-values (x y z) (values 1 2 3))
x
y
z

; Variable assignment 
(define ice 9)
ice
(set! ice 81)


;;;;;;;;;;;;;; Symbols Identifiers and Keywords ;;;;;;;;;;;;;;;;;;;; 

(define 2x3 7) ; any string can be an identifier
2x3

'this-is-a-symbol ; a symbol is just a quoted identifier
; Symbols are second rate strings and are usually used like enums in other languages

; A keyword is an identifier prefixed with #:
; keywords are mainly used to identify optional arguments in function calls
(~r pi #:precision 2) ; a keyword that specifies the precision of the return of the function ~r


;;;;;;;;;;;;;; Equality ;;;;;;;;;;;;;;;;;;;; 

(define c '(1 2 3))
(define d '(1 2 3))

(equal? c d) ; asking if a and b have the same value #t
(eq? c d) ; asking if a and b are the same object #f 

(define v '(1 2 3))
(define p v)
(eq? v p) ; #t

; Note, however that mutating the value of v won't mutate the value of p 
; even tough one is defined in terms of another
(set! v '(4 5 6))
v
p 

; Equality is different for numbers
; Numbers are actually fixnums and they are unique, there is only 
; one instance of every number, no matter how many different identifers
; they may be bound to, thus:
(define myFixnum 123)
(define myOtherFixnum 123)
(eq? myFixnum myOtherFixnum) ; #t

; Futrher more there is another special predicate that can only be used
; with numbers, =
(= 123 123) ; #t
(= 123 321) ; #f
; (= '(123) '(123)) will error out, is not defined for lists 


;;;;;;;;;;;;;; Strings and Things ;;;;;;;;;;;;;;;;;;;; 

;;;;;; Characters ;;;;;;
#\A ; literal character
#\u0041 ; unicode character
#\ ; space character
#\u0020 ;also space

(char->integer #\u0041) ; from hex to int
(integer->char 65) ; as 65 is \u0041 this will give us A
(char-alphabetic? #\a) ; #t
(char-alphabetic? #\1) ; #f
(char-numeric? #\1) ; #t
(char-numeric? #\a) ; #f

'(#\u2660 #\u2663 #\u2665 #\u2666) ; unicode characters that are emojis/symbols


;;;;;; Strings ;;;;;;;

"This is a string"

"Happy: \u263a" ; unicode can be embedded in strings

(string-append "My metal face " "mask" " with a built in crown") ; appending

(string-ref "abcdef" 2) ; accessing characters withing a string
(string-ref "abcdef" 1) ; strings are zero indexed 

(define mutableString (string #\I #\ #\a #\m #\ #\m #\u #\t #\a #\b #\l #\e)) ; we have to use characters 
mutableString ; defining a mutable string with the string function

; Mutating the characters of our mutable string
(string-set! mutableString 5 #\a)
(string-set! mutableString 6 #\ )
mutableString

; another way of defining mutable strings
(define mstr (string-copy "I am also mutable"))
(string-set! mstr 5 #\space )
(string-set! mstr 6 #\space )
mstr

; yet another mutable string
(define exes (make-string 10 #\X))
(string-set! exes 5 #\O)
exes


;;;;;;;;;;;;;; Useful String Functions ;;;;;;;;;;;;;;;;;;;; 

(string-length mutableString) ; evaluates to the number of characters

(substring mutableString 7 12) ; characters 7-11

(string-titlecase mutableString) ; capitalizes the first character of each word

(string-upcase "big")
(string-downcase "SMALL")

(string<=? "big" "small") ; alphabetical comparison
(string>=? "big" "small") 

(string=? "big" "small") ; #f
(string=? "big" "big") ; #t

(define nietzche-quote "Without music, life would be a mistake")
(string-replace nietzche-quote "music" "racket") ; replacement
nietzche-quote

(string-contains? nietzche-quote "would") ; #t
(string-contains? nietzche-quote "Would") ; #f

(string-split nietzche-quote) 
(string-split nietzche-quote ",") ; split using separator
nietzche-quote ; note how this doesnt alter the value of the original string

(string-trim "    hello    ")
(string-trim "    hello    " #:right? #f)
(string-trim "    hello    " #:left? #f)


;;;;;;;;;;;;; String Conversion and Formatting Functions ;;;;;;;;;;;;;;;;;;;

(symbol->string 'FBI) ; "FBI"

(string->symbol "FBI") ; 'FBI

(list->string '(#\x #\y #\z)) ;"xyz"

(string->list "xyz") ; (#\x #\y #\z)

(string->keyword "string->keyword") ; #:string->keyword

(keyword->string '#:keyword) ; "keyword"

; within the format statement ~a acts as a placeholder
(format "let ~a = ~a" "x" 2) ; 2 is automatically converted to a string 
(format "~a ~a ~a" "testing" "this" "thing")

; to simply convert a nubmer to a string
(number->string pi)
; conversely
(string->number "3.14159265389793")

(string->number "five") ; #f

; for more control we can use the ~r function
(~r pi #:precision 4)
(~r pi #:min-width 20 #:precision 4 #:pad-string "*")

