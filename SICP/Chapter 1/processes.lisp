; recursive process (no state)
(define (fn n)
  (if (< n 3)
      n
      (+ (fn (- n 1))
         (* 2 (fn (- n 2)))
         (* 3 (fn (- n 3))))))

; expansion
; (fn 4)
; (+ (fn 3) (* 2 (fn 2)) (* 3 (fn 1)))
; (+ (+ (fn 2) (* 2 (fn 1)) (* 3 (fn 0))) 4 3)
; (+ (+ 2 2 0) 4 3)
; (+ 4 4 3)
; 11

; (fn 6)
; (+ (fn 5) (* 2 (fn 4)) (* 3 (fn 3)))
; (+ (fn 5) (* 2 11) (* 3 4))
; (+ (+ 11 8 6) 22 12)
; (+ 25 22 12)
; 59

; how is the input being transformed?
; where does the mutation overlap with the next step?
; is there a logical place to initialize state?

; the computation takes n and continuously mutates it
; into the first, second or third factors of 0, 1, and 2. 
; when all terms are expressed this way, the terms are
; added together

; 0 1 2 3 4 6

; (fn n) is always the sum of a selection of the above set
; if the lower threshold were 4, the set would be:

; 0 1 2 3 4 6 9

; as the threshold decreases, the outputs are larger in
; magnitude than their counterparts with higher thresholds

; iterative process (w/ state)
(define (fn-i n)
  (fn-iter 1 0 n))

(define (fn-iter a b counter)
  (if (= count 0)
      b
      (fn-iter b (fn counter) (- counter 1)))))