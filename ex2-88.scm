(define (negate-term t)
        (make-term (order t) 
                   (sub (make-scheme-number 0) (coeff t1))))

(define (subtract-terms t1 t2) 
  (cond ((empty-termlist? L1) (map negate L2))
        ((empty-termlist? L2) L1)
        (else 
          (let ((t1 (first-term L1)) (t2 (first-term L2)))
            (cond ((> (order t1) (order t2))
              (adjoin-term t1 (subtract-terms (rest-terms L1) L2)))
                  ((< (order t1) (order t2))
              (adjoin-term (negate t2) (subtract-terms L1 (rest-terms L2))))
              (else
                (adjoin-term 
                  (make-term (order t1) (sub (coeff t1) (coeff t2)))
                  (subtract-terms (rest-terms L1)
                                  (rest-terms L2)))))))))           
        
(define (subtract-poly p1 p2)
  (if (same-variable? (variable p1) (variable p2))
      (make-poly (variable p1)
                 (subtract-terms (term-list p1)
                                 (term-list p2)))
      (error "Polys not in same var -- SUBTRACT-POLY"
             (list p1 p2))))

