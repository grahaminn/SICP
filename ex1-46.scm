(define (iterative-improve good-enough improve)
  (lambda (guess) 
    (if (good-enough guess) 
      guess
      ((iterative-improve good-enough improve) (improve guess))   
    )
  )
)

(define (sqrt-good-enough? x)
  (lambda (guess) 
    (< (abs (- (square guess) x)) 0.001)
  )
)

(define (average x y) (/ (+ x y) 2))

(define (sqrt-improve x) 
  (lambda (guess) (average guess (/ x guess)))
)

(define (sqrt x) 
  ((iterative-improve (sqrt-good-enough? x) (sqrt-improve x)) 1.0)
)

(sqrt 4.0)

(define tolerance 0.00001)

(define (close-enough? f) (lambda (guess) (< (abs (- guess (f guess))) tolerance))) 

(define (fixed-point f first-guess) ((iterative-improve (close-enough? f) f) first-guess))

(define reciprocal (lambda (x) (average x (/ 1.0 x))))

(fixed-point reciprocal 2.0) 

(define (sqrt x) (lambda (y) (average y (/ x y))))

(fixed-point (sqrt 9.0) 2.0)
