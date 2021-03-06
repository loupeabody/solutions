(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

; (A 1 3)
; (A 0 (A 1 2))
; (A 0 (A 0 (A 1 1)))
; (A 0 (A 0 2))
; (A 0 4)
; 8

; (A 1 2)
; (A 0 (A 1 1))
; (A 0 2)
; 4

; (A 2 2)
; (A 1 (A 2 1))
; (A 0 (A 1 (- (A 2 1) 1)))
; (A 0 (A 1 (- 2 1)))
; (A 0 (A 1 1))
; (A 0 2)
; 4

; (A 2 3)
; (A 1 (A 2 2))
; (A 0 (A 1 (- (A 2 2) 1)))
; (A 0 (A 1 (- (A 1 (A 2 1) 1))))
; (A 0 (A 1 (- (A 1 2) 1)))
; (A 0 (A 1 (- (A 0 (A 1 1)) 1))))
; (A 0 (A 1 (- (A 0 2) 1)))
; (A 0 (A 1 3))
; (A 0 (A 0 (A 1 2))
; (A 0 (A 0 (A 0 (A 1 1))))
; (A 0 (A 0 (A 0 2)))
; (A 0 (A 0 4))
; (A 0 8)
; 16

; (A 2 4)
; (A 1 (A 2 3))
; (A 0 (A 1 (- (A 2 3) 1)))
; (A 0 (A 1 (- (A 1 (A 2 2)) 1)))
; ; (A 2 2) evaluates to 4
; (A 0 (A 1 (- (A 1 4) 1)))
; ; (A 1 4) evaluates to 16
; (A 0 (A 1 (- 16 1)))
; (A 0 (A 1 15))
; (A 0 (A 0 (A 1 14)))
; (A 0 (A 0 (A 0 (A 1 13))))
; (A 0 (A 0 (A 0 (A 0 (A 1 12)))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 11))))))
; ...
; (A 1 n) evaluates to 2^n
; 65536