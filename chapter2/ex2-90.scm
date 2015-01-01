(define (make-dense-poly variable terms) (cons variable (attach-tag 'dense terms))
(define (make-sparse-poly variable terms) (cons variable (attach-tage 'sparse terms))
(define (term-list p) (cddr p))
(define (variable p) (cadr p))
(define (empty-termlist? tl) (not (pair? (content tl)))) 
(define (rest-terms tl) (tag (type-tag tl) (cdr (content tl))) 
(define (sparse? tl) (eq? (type-tag tl) 'sparse))
(define (dense? tl (eq? (type-tag tl) 'dense))

(define (adjoin-term-to-sparse-list term term-list)
  (if (=zero? (coeff term))
    term-list
    (if (= (order term) (length term-list))
      (list (coeff term) term-list)
      (adjoin-term-to-sparse-list term (list 0 term-list)))))

(define (adjoin-term-to-dense-list term term-list)
  (if (=zero? (coeff term))
    term-list
    (cons term term-list))) 

(define (adjoin-term term tl)
  (if (=zero? (coeff term))
    p
    (cond ((sparse? tl)
        (adjoin-term-to-sparse-list term tl))
          ((dense? tl)
        (adjoin-term-to-dense-list term tl))
          (else (error "Unknown expression type" p))
 )))))

(define (first-term p) 
  (let (tl (term-list p)))
  (cond ((sparse? tl) (make-term (- (length tl) 1) (car tl)))
        ((dense? tl) (car tl))
        (else (error "Unknown expression type" p))
 ))

(define (add-polynomials p1 p2)
  (let ((tl1 (term-list p1)) (tl2 (term-list p2))
  (cond 
    ((empty-termlist? tl1) p2)
    ((empty-termlist? tl2) p1)
    (else 
      (let ((t1 (first-term tl1)) (t2 (first-term tl2)))
        (cond ((> (order t1) (order t2))
                  (adjoin-term
                   t1 (add-terms (rest-terms tl1) tl2)))
                 ((< (order t1) (order t2))
                  (adjoin-term
                   t2 (add-terms tl1 (rest-terms tl2))))
                 (else
                  (adjoin-term
                   (make-term (order t1) (add (coeff t1) (coeff t2)))
                   (add-terms (rest-terms tl1) (rest-terms tl2)))))))))))
    









