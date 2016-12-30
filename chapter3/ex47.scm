(define (make-semaphore n)
	(let ((mutex (make-mutex)))
		(define (the-semaphore s)
			(cond 
				((eq? s 'acquire) 
					(mutex 'acquire)
					(if (> n 0)
						((set! n (- n 1)) (m 'release))
						((m 'release) (the-semaphore 'acquire))))
				((eq? s 'release)
					(mutex 'acquire)
					(set! n (+ n 1))
					(mutex 'release))))))

(define (make-semaphore2 n)
	(let ((cell (list false))
		(define (the-semaphore s)
			(let ((count n)
				(cond 
					((eq? s 'acquire)
						(if (test-and-set! cell)
							(the-semaphore s)
							(if (= count 0)
								(begin (clear! cell) (the-semaphore s))
								(begin (set! count (- count 1) (clear! cell))))))
					((eq? s 'release) 
						(if (test-and-set! cell)
							(the-semaphore s)
							(begin (set! count (+ count 1)) (clear! cell)))))))))))
					  
	
																		

             
