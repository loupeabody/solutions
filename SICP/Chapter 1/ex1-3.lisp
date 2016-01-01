(define (sumofsquares x y) (+ (* x x) (* y y)))

(define (trisquare x y z) 
    (cond 
        ((and (< x y) (< x z)) (sumofsquares y z))
        ((and (< y x) (< y z)) (sumofsquares x z))
        ((and (< z x) (< z y)) (sumofsquares x y))
        (else #f))
)