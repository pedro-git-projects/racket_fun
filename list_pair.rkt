#lang racket
(pair? (cons 1 2))
(list? (cons 1 2))
; A list is always a pair, but a pair is not always a list
(pair? (cons 1 '()))
(list? (cons 1 '()))