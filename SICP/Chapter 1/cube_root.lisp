(define (improve guess x)
  (/ (+ (/ x (square guess)) (* guess 2)) 3))
    
(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))
  
(define (cube-iter guess x lastguess)
  (if (steptest guess lastguess)
      guess 
      (cube-iter (improve guess x) 
                 x
                 guess)))

(define (steptest x y)
  (< (abs (- y x)) (/ x 1000 )))

(define (cube-root x)
  (cube-iter 1.0 x x))