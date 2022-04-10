#lang racket

; Defining a transaction struct
(struct transaction 
  (date payee check-number (amount #:mutable))) ; making field mutable using keyword

; Instantiating a transaction struct
(define trans (transaction 20220410 "Tony" 1012 100.10))

; Racket will automatically create an accessor method <struct-name>-<fieldname> <instancename>
(transaction-date trans)

(transaction-payee trans)

(transaction-check-number trans)

(transaction-amount trans)

; Trying to use a mutator to modify a field value will result in an error by default
; (set-transaction-payee! trans "Smeden")  will error out because no mutator has been exported
(set-transaction-amount! trans 100.12)
(transaction-amount trans)

; Making all fields mutable
(struct mutable-transaction  
  ( date payee check-number amount) #:mutable)

(define mutable-trans (mutable-transaction 20210511 "Pedro" 2560 150.00))

(set-mutable-transaction-payee! mutable-trans "Djalma")
(mutable-transaction-payee mutable-trans)

; Making so that we can see all fields when invoking our structs
(struct transparent-transaction 
  (date payee check-number amount)#:mutable #:transparent)

(define t (transparent-transaction 20220410 "Milo" 4501 30.00))
t

; validating fields with guard
(struct guarded
  (date payee check-number amount)
  #:mutable #:transparent
  #:guard(λ (date payee num amt name) ; takes struct field + struct name 
		(unless (> num 0)
		(error "Not a valid check number"))
		(values date payee num amt))) ; returning the same number of values as struct fields

; (guarded 20210511 "Valdemar" -2383 98.9) will print Not a valid check number and trhow an error

(define last-check 1000)
(struct check
  (date payee check-number amount)
  #:mutable #:transparent
  #:guard(λ(date payee num amt name)
		   (cond
			 [(< num 0)
			  (error "Not a valid check number")]
			 [(= num 0)
			  (let ([next-num (add1 last-check)]) ; next-num = last-check + 1
					(set! last-check next-num) ; last-check = next-num
					(values date payee next-num amt))] ; struct is populated using next-num instead of num
			 [else 
			   (set! last-check num) ; last-check = num
			   (values date payee num amt)])))

(check 20220410 "Onodera Punpun" 0 100.50)

(check 20220410 "John Doe" 1030 100.50)

(check 20220410 "Tanaka Aiko" 0 100.50)
