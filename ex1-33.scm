(define (filtered-accumulate filter accumulator init term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (if (filter a) (accumulator result (term a)) result))))
  (iter a init))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (square x) (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

;a sum of square of primes in interval a->b where prime? already defined 

(define (sum-prime-squares a b) (filtered-accumulate prime? + 0 square a (lambda (x) (+ x 1)) b))

(sum-prime-squares 1 7)

;b product of all positive integets less than n which are prime relative to n

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
  
(define (integer-product-relative-primes n) (filtered-accumulate (lambda (x) (= (gcd x n) 1)) * 1 (lambda (y) y) 1 (lambda (z) (+ z 1)) n))

(integer-product-relative-primes 10) 
