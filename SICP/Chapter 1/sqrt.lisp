; (define (sqrt-iter guess x)
;   (if (good-enough? guess x) 
;       guess 
;       (sqrt-iter (improve guess x) 
;                  x)))
                  
(define (improve guess x)
  (average guess (/ x guess)))
    
(define (average x y)
  (/ (+ x y) 2))
    
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
    
(define (square x)
  (* x x))

; (define (sqrt x)
;   (sqrt-iter 1.0 x))

; Improved good enough test

(define (sqrt-iter guess x lastguess)
  (if (steptest guess lastguess) 
      guess 
      (sqrt-iter (improve guess x) 
                 x
                 guess)))

(define (steptest x y)
  (< (abs (- y x ) ) (/ x 1000 ) ))

(define (sqrt x)
  (sqrt-iter 1.0 x x))