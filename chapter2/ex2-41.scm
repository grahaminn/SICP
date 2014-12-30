(define (collection-min x)
    (if (pair? x)
      (accumulate min (car x) (cdr x))
      x))

(define (filter-sum sum)
  (lambda (x) 
    (if (pair? x)
      (<= (accumulate + (car x) (cdr x)) sum)
      (<= x sum))))

(define (unique-triples n s)
    (filter (filter-sum s) (accumulate append '() 
       (map (lambda (x) (map (lambda (y) (flatten (list y x))) (enumerate-interval 1 (- (collection-min x) 1)))) (unique-pairs n)))))
