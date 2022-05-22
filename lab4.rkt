#lang racket
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;     CS 381 - Programming Lab #4	;
;					;
;  Marilyn Leary			;
;  learym@oregonstate.edu	        ;
;					;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; member takes to parameters, e and lst
; this function will determine if element "e" is part of the list "lst"
; returns "#t" if yes and "#f" if no
(define (member? e lst)
  (cond ((null? lst) #f) ;return false if list is empty
        ((eq? e (first lst)) #t) ;return true if the first element in the list is e
        (else (member? e (rest lst))))
)

; check that list has no duplicates 
(define (set? lst) 
  (cond ((empty? lst) #t) ;return true is list is empty
        ((member? (first lst) (rest lst)) #f) ; if member? is true, return false
        (else (set? (rest lst))))
)

; Union Function
; take the set union of lst1 and lst2 and return a list representing the mathematical
; union of the two lists
; set? and member? as well as common Racket functions may be used
; union = everything in lst1 and lst2; do not repeat elements that occur in both
; return type = list
(define (union lst1 lst2)
  (cond ((empty? lst1) lst2) ; is this suficient? or do i need to check for duplicates within that list?
        ; check if first element in lst1 is in lst2
        ((member? (first lst1) lst2)
         (union (rest lst1) lst2)) ; check the rest of the list
        (else (union (rest lst1) (cons (first lst1) lst2))))
  )

; Intersection Function
; take the set intersection of lst1 and lst2 and return a list representing the mathematical intersection
; of the two lists
; intersection = grab only elements that occur in both lists
; return type = list
(define (intersect lst1 lst2)
  ; if either list is empty, return empty list
  ; make a new list?
  ; use member --> if element in 1 is in 2, add to new list
  ; go trhough each item in the list
)



;;;;;;;;;;;;;;;;;
;  DO NOT EDIT  ;
;;;;;;;;;;;;;;;;;
; enables testing via piping in stdin

(define-namespace-anchor anc)
(define ns (namespace-anchor->namespace anc))
(let loop ()
  (define line (read-line (current-input-port) 'any))
  (if (eof-object? line)
    (display "")
    (begin (print (eval (read (open-input-string line)) ns)) (newline) (loop))))

