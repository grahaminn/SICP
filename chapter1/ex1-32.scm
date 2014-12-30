
;recursive
(define (accumulate_r op defval term a next b)
    (if (> a b)
        defval
        (op (term a) (accumulate_r op defval term (next a) next b))
    )
)

(define (sum_r term a next b) (accumulate_r + 0 term a next b))
(define (product_r term a next b) (accumulate_r * 1 term a next b))


;iterative
(define (accumulate_i op defval term a next b)
    (define (iter a res)
        (if (> a b)
            res
            (iter (next a) (op (term a) res ))
        )
    )
    (iter a defval)
)

(define (sum_i term a next b) (accumulate_i + 0 term a next b))
(define (product_i term a next b) (accumulate_i * 1 term a next b))


; Simple tests...
(define (f x)(* 2 x))

(define (inc1 x)(+ x 1))

; 1*2 + 2*2 + 3*2 =
;  2  +  4  +  6  = 12
(sum_r f 1 inc1 3)
(sum_i f 1 inc1 3)

; 1*2 * 2*2 * 3*2 =
;  2  *  4  *  6  = 48
(product_r f 1 inc1 3)
(product_i f 1 inc1 3)
