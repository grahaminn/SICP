(define (exp x n)
  (define (exp-iter y n)
  (if (= n 1)
      y
      (exp-iter (* x y) (- n 1))))
  (exp-iter x n))

(define (integer-root x root)
  (define (integer-root-iter y n)
    (if (not (= (remainder y root) 0))
        n
        (integer-root-iter (/ y root) (+ n 1))))
  (integer-root-iter x 0))
        
(define (cons-non-neg-integers a b) (* (exp 2 a) (exp 3 b)))
(define (car-non-neg-integers x) (integer-root x 2))
(define (cdr-non-neg-integers x) (integer-root x 3))
