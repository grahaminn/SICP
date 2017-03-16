(require-extension sicp-streams)


(define (expand num den radix) 
	(cons-stream 
		(quotient (* num radix) den)
		(expand (remainder (* num radix) den) den radix)))

(define x (expand 1 7 10))
(define y (expand 3 8 10))
