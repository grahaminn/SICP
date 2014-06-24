(define (double x)
  (* x 2))

(define (halve x)
  (/ x 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-exp b n) (fast-exp-iter b b (- n 1)))

(define (fast-exp-iter a b n) 
   (cond ((= n 0) a)
         ((even? n) (fast-exp-iter (square b) b (/ n 2)))
         (else (fast-exp-iter (* a b) b (- n 1))))
)
