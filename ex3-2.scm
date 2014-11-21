(define (make-monitored f) 
  (define count 0)
  (define (dispatch m) 
    (cond ((eq? m 'reset-count) (begin (set! count 0)))
          ((eq? m 'how-many-calls?) count)
          (else (begin (set! count (+ 1 count))) (f m))  
    )
  )
  dispatch
)

(define square (lambda (x) (* x x)))

(define sqm (make-monitored square))

(sqm 2)

(sqm 3)

(sqm 'how-many-calls?)

(sqm 'reset-count)

(sqm 'how-many-calls?)
