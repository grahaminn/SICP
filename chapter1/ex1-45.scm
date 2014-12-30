(define (average x y) (/ (+ x y) 2))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))


(define (compose f g) (lambda (x y) (f x (g x y))))

(define (repeat f n) 
  (if (< n 2) 
      f
      (repeat (compose f f) (- n 1))))

(define (nth-root x n) 
  (fixed-point (lambda (y) ((repeat average (- n 1)) y (/ x (expt y (- n 1))))) 1.0))

(nth-root 16 8) 


