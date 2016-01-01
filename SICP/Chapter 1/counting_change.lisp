; counting change recursively

; (define (count-change amount)
;     (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
    ((or (< amount 0) (= kinds-of-coins 0)) 0)
    (else (+ (cc amount
                 (- kinds-of-coins 1))
             (cc (- amount
                    (first-denomination kinds-of-coins))
                 kinds-of-coins)))))

; (define (first-denomination kinds-of-coins)
;   (cond ((= kinds-of-coins 1) 1)
;         ((= kinds-of-coins 2) 5)
;         ((= kinds-of-coins 3) 10)
;         ((= kinds-of-coins 4) 25)
;         ((= kinds-of-coins 5) 50)))

; (+ (cc amount (- kinds-of-coins 1)) (cc (- amount (first-denomination kinds-of-coins)) kinds-of-coins))

; change for 10 cents using pennies and nickels
; expansion
; where:
; (define (count-change amount)
;     (cc amount 2))
; and:    
; (define (first-denomination kinds-of-coins)
;   (cond ((= kinds-of-coins 1) 1)
;         ((= kinds-of-coins 2) 5)))
;
; (count-change 10)
; (cc 10 2)
; (+ (cc 10 1) (cc 5 2))
; (+ (+ (cc 10 0) (cc 9 1)) (+ (cc 5 1) (cc 0 2)))
; (+ (+ 0 (cc 9 1)) (+ (cc 5 1) 1))
; (+ (+ 0 (+ (cc 9 0) (cc 8 1))) (+ (+ (cc 5 0) (cc 4 1)) 1))
; (+ (+ 0 (+ 0 (cc 8 1))) (+ (+ 0 (cc 4 1)) 1))
; (+ (+ 0 (+ 0 (+ (cc 8 0) (cc 7 1)))) (+ (+ 0 (+ (cc 4 0) (cc 3 1))) 1))
; (+ (+ 0 (+ 0 (+ 0 (cc 7 1)))) (+ (+ 0 (+ 0 (cc 3 1))) 1))
; (+ (+ 0 (+ 0 (+ 0 (+ (cc 7 0) (cc 6 1))))) (+ (+ 0 (+ 0 (+ (cc 3 0) (cc 2 1)))) 1))
; (+ (+ 0 (+ 0 (+ 0 (+ 0 (cc 6 1))))) (+ (+ 0 (+ 0 (+ 0 (cc 2 1)))) 1))
; (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ (cc 6 0) (cc 5 1)))))) (+ (+ 0 (+ 0 (+ 0 (+ (cc 2 0) (cc 1 1))))) 1))
; (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (cc 5 1)))))) (+ (+ 0 (+ 0 (+ 0 (+ 0 (cc 1 1))))) 1))
; (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ (cc 5 0) (cc 4 1))))))) (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ (cc 1 0) (cc 0 1)))))) 1))
; (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ (cc 4 0) (cc 3 1)))))))) (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 1))))) 1))
; (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (cc 3 1)))))))) (+ (+ 0 (+ 0 (+ 0 (+ 0 1)))) 1))
; (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ (cc 3 0) (cc 2 1))))))))) (+ (+ 0 (+ 0 (+ 0 1))) 1))
; (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ (cc 2 0) (cc 1 1)))))))))) (+ (+ 0 (+ 0 1)) 1))
; (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ (cc 1 0) (cc 0 1))))))))))) (+ (+ 0 1) 1))
; (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 1)))))))))) (+ (+ 0 1) 1))
; (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 1))))))))) (+ 1 1))
; (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 1))))))))) 2)
; ...
; (+ 1 2)
; 3

; (+ (cc 10 1) (cc 5 2))
; (+ (+ (cc 10 0) (cc 9 1)) (+ (cc 5 1) (cc 0 2)))
; (+ (+ 0 (+ (cc 9 0) (cc 8 1))) (+ (+ (cc 5 0) (cc 4 1)) 1))
; (+ (+ 0 (+ 0 (+ (cc 8 0) (cc 7 1)))) (+ (+ 0 (+ (cc 4 0) (cc 3 1))) 1))
; (+ (+ 0 (+ 0 (+ 0 (+ (cc 7 0) (cc 6 1))))) (+ (+ 0 (+ 0 (+ (cc 3 0) (cc 2 1)))) 1))
; (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ (cc 6 0) (cc 5 1)))))) (+ (+ 0 (+ 0 (+ 0 (+ (cc 2 0) (cc 1 1))))) 1))
; (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ (cc 5 0) (cc 4 1))))))) (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ (cc 1 0) (cc 0 1)))))) 1))
; (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (cc 3 1)))))))) (+ (+ 0 (+ 0 (+ 0 (+ 0 1)))) 1))
; (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ (cc 2 0) (cc 1 1)))))))))) (+ (+ 0 (+ 0 1)) 1))
; (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 1)))))))))) (+ (+ 0 1) 1))
; (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 1))))))))) 2)
; 3

; The three ways to count 10 cents with only nickels and pennies are:

;   - 10 pennies (cc 10 1)
;   - 2 nickels (cc 0 2)
;   - 5 pennies and 1 nickel (+ (cc 5 1) (cc 0 2))
 
; Following the definition of how this procedure works in the text:

;   - Larger demoninations are resolved first (as a result of how the cond 
;     clauses are arranged in first-denomination)
;   - The key work being done is when an amount is reduced to zero, demonstrating
;     how a single denomination will reduce the initial amount
;   - Other existing denominations are handed the reduced amounts

; It's clear within the expansion that this tree recursive process is inefficient
; as many identical function calls repeat throughout. Given the nature of the
; process, however, it is not clear how to acheive the same result iteratively.

; Whatever the solution may be, it will involve the defining characteristic of 
; iterative procedure definitions: the use of state variables