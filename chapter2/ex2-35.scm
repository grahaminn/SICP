(define (count-leaves t)
(accumulate + 0 (map (lambda (x) (if (pair? x) (count-leaves x) 1)) t)))

(define tree1a (cons (list 1 2) (list 3 4)))

(define tree2a (cons (list 1 2) (cons (list 3 4 5) '(6))))
