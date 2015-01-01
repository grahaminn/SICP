(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess prevguess)
  (< 
    (abs 
      (- guess prevguess)
    ) 
    (* 0.001 guess)
  )
)

(define (sqrt-iter guess prevguess x)
  (if (good-enough? guess prevguess)
      guess
      (sqrt-iter (improve guess x)
		 guess
		 x)))

(define (sqrt x)
  (sqrt-iter 1.0 0.0 x))
