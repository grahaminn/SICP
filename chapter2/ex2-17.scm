(define (length items)
     (define (length-iter a count)
       (if (null? a)
           count
           (length-iter (cdr a) (+ 1 count))))
     (length-iter items 0))

(define (last-pair list)
  (if (null? (cdr list))
      list
      (last-pair (cdr list))))
