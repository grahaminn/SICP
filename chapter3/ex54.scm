(define (mul-streams a b) 
	(stream-cons 
		(* (stream-car a) (stream-car b)) 
		(mul-streams (stream-cdr a) (stream-cdr b))))

(define integers (cons-stream 1 (add-streams ones integers)))

(define factorials (cons-stream 1 (mul-streams factorials integers)))
