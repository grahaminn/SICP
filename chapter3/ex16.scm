(define (count-pairs x)
	(if (not (pair? x))
		0
		(+ (count-pairs (car x)) 
		   (count-pairs (cdr x)) 
		   1)))

(define i (cons 'a 'b))
(define j (cons 'c 'd))
(define k (cons 'e 'f))

(count-pairs i)

(count-pairs (cons (cons i j) k))

(set-cdr! j k)

(set-cdr! i k)

(set-car! i j)

(count-pairs i)

