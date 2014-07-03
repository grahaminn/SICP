(define (cube x) (* x x x))
(define (p x) (write 'x)(- (* 3 x) (* 4 (cube x))))
(define (sine angle)
    (if (not (> (abs angle) 0.1))
        angle
        (p (sine (/ angle 3.0)))))



(sine 12.15)
; prints 'xxxxx' so proc p called 5 times



(sine 1)
(sine 10)
(sine 100)


