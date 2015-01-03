(define (contains list x)
    (cond
        ((null? list) #f)
        (else
            (if (eq? x (car list))
                #t
                (contains (cdr list) x)))))

(define (detect-cycle x)
	(define (cycle-iter x visited)
		(if (pair? x)
			(if (contains visited (car x))
				#t
				(cycle-iter (cdr x) (cons (car x) visited)))
			#f))
	(cycle-iter x '())
)

(define y '(a b c))

(define z (cons y y))

(set-cdr! z z)

(detect-cycle y)
(detect-cycle z)
