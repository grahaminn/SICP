(define (smallest-divisor n) (find-divisor n 2))
    (define (find-divisor n test-divisor)
      (cond ((> (square test-divisor) n) n)
            ((divides? test-divisor n) test-divisor)
            (else (find-divisor n (+ test-divisor 1)))))
    (define (divides? a b) (= (remainder b a) 0))
    
(define (prime? n)
      (= n (smallest-divisor n)))

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

(define (unique-pairs n)
  (accumulate append '{} (map (lambda (x) 
         (map (lambda (y) (cons x y)) 
              (enumerate-interval 1 (- x 1)))) (enumerate-interval 1 n))))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cdr pair))))

(define (make-pair-sum pair)
      (list (car pair) (cdr pair) (+ (car pair) (cdr pair))))

(define (prime-sum-pairs n) (map make-pair-sum (filter prime-sum? (unique-pairs n))))
