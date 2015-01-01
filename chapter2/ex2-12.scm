(define (make-centre-percent centre tolerance) (cons (- centre (* centre (/ tolerance 100))) (+ centre (* centre (/ tolerance 100)))))
(define (percent interval) (* (- (/ (cdr interval) (average (car interval) (cdr interval))) 1) 100))
