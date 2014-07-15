
(define (square x)
    (* x x )
    )

(define (cube x)
    (* x x x)
)


(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)  (sum term (next a) next b))
    )
)


(define (simpson f a b n)
        (define hh (/ (- b a) n))

        (define (inc x) (+ x 1))

        (define (y k)
            (f (+ a (* k hh)))
            )

        (define (next-term k)
            (if (or (= k 0) (= k n))
                (y k)
                (if (= (remainder k 2) 1)
                    (* 4 (y k))
                    (* 2 (y k))
                )
            )
        )

        (if (= (remainder n 2) 0)
            (* (/ hh 3) (sum next-term 0 inc n))
            -1
        )
)

(simpson cube 0 1 2)
(simpson cube 0 1 5)
(simpson cube 0 1 10)
(simpson cube 0 1 100)
(simpson cube 0 1 1000)


(simpson square 0 1 2)
(simpson square 0 1 5)
(simpson square 0 1 10)
