(define tolerance 0.000001)

(define (close-enough? v1 v2) (< (abs (- v1 v2)) tolerance))

(define (iterative-improve improve)
  (lambda (guess) 
    (if (close-enough? guess (improve guess)) 
      guess
      ((iterative-improve improve) (improve guess))   
    )
  )
)

(define (average x y) (/ (+ x y) 2))

(define (sqrt-improve x) 
  (lambda (guess) (average guess (/ x guess)))
)

(define (sqrt x) 
  ((iterative-improve (sqrt-improve x)) 1.0)
)

(sqrt 4.0)

(define (fixed-point f first-guess) ((iterative-improve f) first-guess))

(define reciprocal (lambda (x) (average x (/ 1.0 x))))

(fixed-point reciprocal 2.0) 

(define (sqrt x) (lambda (y) (average y (/ x y))))

(fixed-point (sqrt 9.0) 2.0)
