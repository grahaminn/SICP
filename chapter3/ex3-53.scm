(define (mul-streams a b) 
	(cons-stream 
		(* (stream-car a) (stream-car b)) 
		(mul-streams (stream-cdr a) (stream-cdr b))))

(define factorials (

