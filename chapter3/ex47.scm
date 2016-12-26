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

	
																		

             
