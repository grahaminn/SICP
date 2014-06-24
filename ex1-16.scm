(define (double x)
  (* x 2))

(define (halve x)
  (/ x 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-mult b n)
  (cond ((= n 0) 0)
        ((even? n) (double (fast-mult b (halve n))))
        (else (+ b (fast-mult b (- n 1))))))

(fast-mult 13563 46216)
