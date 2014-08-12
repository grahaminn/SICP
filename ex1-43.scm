(define (compose f g)
    ( lambda (x) (f (g x)) )
)

(define (square x) (* x x) )


; Called the function sq - to make it easier to follow (should be called func or f or similar)
(define (rep sq n)
    (if (> n 0)
        ( compose sq (rep sq (- n 1)) )
        ( lambda (x) x )   ; Must return a function not just x
    )
)

; This appears to actually work...
;((5^2)^2)
;(5 * 5)^2)
;(5 * 5) *  5 * 5)
;(25 * 25) = 625
((rep square 2) 5)



