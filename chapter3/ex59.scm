(require-extension sicp-streams)

;a


(define (multiply-stream a b) 
	(cons-stream 
		(* (stream-car a) (stream-car b)) 
		(multiply-stream (stream-cdr a) (stream-cdr b))))

(define (integrate-series s)
(multiply-stream (stream-map (lambda (x) (/ 1 x)) integers) s))

;b


(define cosine-series (cons-stream 1 (integrate-series sine-series)))

(define sine-series 
	(cons-stream 
		0 
		(scale-stream (integrate-series cosine-series) -1)))
