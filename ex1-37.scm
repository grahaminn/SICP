
(define (cont-fracI n d k)
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



(define (cont-fracR n d k)
    (define (frac-rec i)
        (/ (n i)
           (+ (d i)
              (if (= i k)
                  0
                  (frac-rec (+ i 1))
              )
           )
        )
    )
    (frac-rec 1))




; AIMING FOR ---> 0.618033989
(cont-fracI (lambda (i) 1.0)
           (lambda (i) 1.0)
           10)


; AIMING FOR ---> 0.618033989
(cont-fracR (lambda (i) 1.0)
            (lambda (i) 1.0)
            10)



