(define (div-interval x y)
    (if (and (<= (lower-bound y) 0) (>= (upper-bound y) 0)) 
    -1 
    (mul-interval
     x
     (make-interval (/ 1.0 (upper-bound y))
                    (/ 1.0 (lower-bound y))))))
