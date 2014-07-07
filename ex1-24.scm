(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline) (display n) (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ") (display elapsed-time))

; First 3 primes greater than 1000, 10000, 100000 and 1000000 each generated from ex1-22.scm
(map timed-prime-test '(1009 1013 1019 10007 10009 10037 100003 100019 100043 1000003 1000033 1000037))

(define (expmod base exp m)
  (cond ((= exp 0)
         1)
        ((even? exp)
         (remainder
           (square
             (expmod base (/ exp 2) m))
           m))
        (else
          (remainder
            (* base
               (expmod base (- exp 1) m))
            m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (fast-timed-prime-test n times)
  (newline) (display n) (start-fast-prime-test n (runtime) times))

(define (start-fast-prime-test n start-time times)
  (if (fast-prime? n times)
    (report-prime (- (runtime) start-time))))

(map (lambda (n) (fast-timed-prime-test n 1)) '(1009 1013 1019 10007 10009 10037 100003 100019 100043 1000003 1000033 1000037))
(map (lambda (n) (fast-timed-prime-test n 1000)) '(1009 1013 1019 10007 10009 10037 100003 100019 100043 1000003 1000033 1000037))
