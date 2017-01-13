(define (report-prime elapsed-time)
  (display " *** ") (display elapsed-time))

(define (dumb-fermat-test n)
  (define (try-it a)
    (if (< a n)
      (if (= (expt a n) (modulo a n))
        (try-it (+ a 1))
      false)
    n))
  (try-it 0))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((dumb-fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (start-fast-prime-test n start-time)
  (if (fast-prime? n 1)
    (report-prime (- (runtime) start-time))))

(define (fast-timed-prime-test n)
  (newline) (display n) (start-fast-prime-test n (runtime)))

(map (lambda (x) (fast-timed-prime-test x)) '(2 3 5 7 9 11))
(map (lambda (x) (fast-timed-prime-test x)) '(561 1105 1729 2465 2821 6601))
