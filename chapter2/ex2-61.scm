(define (adjoin-ordered-set x set)
  (cond ((> x (car set)) (cons (car set) (adjoin-ordered-set x (cdr set))))
        ((= x (car set)) set)
        (else (cons x set))))
