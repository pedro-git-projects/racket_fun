#lang racket

; write displays as usable input 
(write "English motherfucker, do you speak it?")
(display "\n")

(write '(you play with matches you get burned))
(display "\n")

(write #\A)
(display "\n")

(write 1.23)
(display "\n")


(write 1/2)
(display "\n")

(write #(a b c))
(display "\n")

; display displays as raw strings
(display "English motherfucker, do you speak it?")
(display "\n")

(display '(you play with matches you get burned))
(display "\n")

(display #\A)
(display "\n")

(display 1.23)
(display "\n")

(display 1/2)
(display "\n")

(display #(a b c))
(display "\n")

; print is similar to write but shows an expression that would evaluate to the same value as the printed one
(print "English motherfucker, do you speak it?")
(display "\n")

(print '(you play with matches you get burned))
(display "\n")

(print #\A)
(display "\n")

(print 1.23)
(display "\n")

(print 1/2)
(display "\n")

(print #(a b c))
(display "\n")

; add a newline 
(println "English motherfucker, do you speak it?")
(writeln "English motherfucker, do you speak it?")
(displayln "English motherfucker, do you speak it?")

; formatted output
(printf "~a + ~a = ~a \n" 1 2 (+ 1 2))
(printf "~a, can you hear ~a? \n" "Watson" "me")
