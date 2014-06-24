(define (double x)
  (* x 2))

(define (halve x)
  (/ x 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-mult b n)
  (cond ((= n 0) 0)
        ((= b 0) 0)
        ((even? n) (double (fast-mult b (halve n))))
        (else (+ b (fast-mult b (- n 1))))))

(fast-mult 1534623 475743)
(fast-mult 0 475743)
(fast-mult 1534623 0)
(fast-mult -1534623 475743)
