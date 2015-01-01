(define (make-rat n d) (cons (if (> (* n d) 0) (abs n) (- 0 (abs n))) (abs d)))
(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
     (newline)
     (display (numer x))
     (display "/")
     (display (denom x)))


(print-rat (make-rat 2 3))
