; Define Tp'q' by applying Tpq twice:
; 
; 	1st Iteration (Tpq):
; 
; 		a'	← bq + aq + ap
; 		b'	← bp + aq
; 
; 	2nd Iteration (Tp'q'):
; 
; 		a''	← b'q + a'q + a'p	= (bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p
; 		b''	← b'p + a'q			= (bp + aq)p + (bq + aq + ap)q
; 
; 	So Tp'q'(a,b) is
; 
; 	a' ← (bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p
; 	b' ← (bp + aq)p + (bq + aq + ap)q
; 
; Show that applying Tqp twice is the same as applying Tp'q' once:
; (list x y z) just returns a list of items instead of a single computed value

(define (t p q a b) 
	(list
		(+ (* b q) (* a q) (* a p))
		(+ (* b p) (* a q))
	)
)

; Use t01 to calculate first three Fibonacci pairs (effectively t01(), t01(t01()) and t01(t01(t01()))
(t 0 1 1 1)
(t 0 1 2 1)
(t 0 1 3 2)

; Now use an explicit t01(t01()) to calculate the second Fibonacci pair by passing in the results of the first call to a second
; (list-ref list index) just returns the item at position "index" in the list "list"
(t 0 1
	(list-ref (t 0 1 1 1) 0)
	(list-ref (t 0 1 1 1) 1)
)


(define (tsquared p q a b) 
	(list
		(+
			(* (+ (* b p) (* a q)) q)
			(* (+ (* b q) (* a q) (* a p)) q)
			(* (+ (* b q) (* a q) (* a p)) p)
        )
		(+
			(* (+ (* b p) (* a q)) p)
			(* (+ (* b q) (* a q) (* a p)) q)
		)
	)
)

; Show our "T squared" function gives the same results as t01(t01()) (ie, tsquared01(1 1) gives the same result as t01(t01(1 1)) - should equal (3,2)
(tsquared 0 1 1 1)

; Compute p' and q' in terms of p and q:
;
; From the second iteration above we know that:
; 		a''	← b'q + a'q + a'p
;		b''	← b'p + a'q	
;
; Or to put it another way (this is the step I really couldn't get without looking up a hint):
; (1)	a''	← bq' + aq' + ap'
; (2)	b''	← bp' + aq'	
;
; b''	= (bp + aq)p + (bq + aq + ap)q
;		= bpp + aqp + bqq + aqq + apq
;		= bpp + bqq + aqq + 2apq
;		= b(pp+qq) + a(qq + 2pq)
;
; So now we know that:
; b''	= bp' + aq'	= b(pp+qq) + a(qq + 2pq)
;
; So we can easily tell from this that:
; 	p' = p^2 + q^2
;	q' = q^2 + 2pq
;
; Now, plugging these formulae into the provided code:

(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))
                   (+ (* q q) (* 2 p q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

; And just to check everything works:
(list (fib 1) (fib 2) (fib 3) (fib 4) (fib 5) (fib 6) (fib 7) (fib 8) (fib 9) (fib 10))
