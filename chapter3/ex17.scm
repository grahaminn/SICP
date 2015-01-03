(define (contains list x)
	(newline)(display "x:")(display x)(display " list:")(display list)(newline) 
	(cond 
		((null? list) #f)
		(else (begin
			(if (eq? x (car list))
				#t
				(contains (cdr list) x))))))

(define (count-pairs x)
	(define (count-pairs-iter x visited)
		(if (not (pair? x))
			0
			(if (contains visited x)
				(+ (count-pairs-iter (car x) visited) (count-pairs-iter (cdr x) visited))
				(begin
                    (if (pair? visited)
						(set! visited (cons x visited))
						(set! visited x)) 
					(+ (count-pairs-iter (car x) visited) (count-pairs-iter (cdr x) visited) 1)))
		)
	)
	(count-pairs-iter x '()))

(define x (list 'a 'b))
(define z1 (cons x x))
(define z2 (cons (list 'a 'b) (list 'a 'b)))

(define (set-to-wow! x)
  (set-car! (car x) 'wow)
  x)

(set-to-wow! z1)
(set-to-wow! z2)

(count-pairs x)

(count-pairs z1)

(count-pairs z2)
