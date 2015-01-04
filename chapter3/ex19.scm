; The clever idea here is going to be a schemified variant of the 'racing pointers' idea 
; sometimes used as an interview questions for imperative languages.

(define (detect-cycle x)
    (define (cycle-iter tail1 tail2)
		(if (and (pair? tail2) (pair? (cdr tail2)))
			(if (eq? (car tail1) (car tail2))
				#t
				(cycle-iter (cdr tail1) (cddr tail2))
			)
			#f
		)
	)
	(cycle-iter x (cdr x))
)

(define y (list 'a 'b))

(define z1 (cons y y))

(define z2 y)

(set-cdr! z2 z2)

(detect-cycle z1)

(detect-cycle z2)
