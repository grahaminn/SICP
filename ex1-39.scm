(define (cont-frac n d k)
    (define (loop result term)
        (if (= term 0)
            result
            (loop (/ (n term)
                     (+ (d term) result))
                  (- term 1)
            )
        )
    )
    (loop 0 k))

(define (square x) (* x x))

(define (tan-cf x k) 
  (cont-frac 
       (lambda (i) (if (= 1 i) x (- 0 (square x))))
       (lambda (i) (- (* 2 i) 1.0))  
   k)
)

(tan-cf 2.0 100)
