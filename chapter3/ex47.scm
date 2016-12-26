(define (make-semaphore n)
  (let ((mutex (make-mutex)))
    (define (the-semaphore s)
      (cond ((eq? s 'acquire)
             
