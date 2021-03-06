(define (adjoin-term term term-list)
  (if (=zero? (coeff term))
      term-list
      (if (= (order term) (length term-list))
          (list (coeff term) term-list)
          (adjoin-term term (list 0 term-list)))))

(define (first-term term-list) (make-term (- (length term-list) 1) (car term-list)))


