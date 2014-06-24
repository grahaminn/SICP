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

(sine 12.15)
(p (sine 4.05))
(p (p (sine 1.35))
(p (p (p (sine 0.45)))
(p (p (p (p (sine 0.15)))
(p (p (p (p (p (sine 0.05)))
