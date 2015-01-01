;a
(define (make-sum2 a b) (list a '+ b))
(define (make-product2 a b) (list a '* b))
(define (sum2? x) (and (pair? x) (eq? (cadr x) '+)))
(define (addend2 s) (car s))
(define (augend2 s) (caddr s))
(define (product2? x) (and (pair? x) (eq? (cadr x) '*)))
(define (multiplier2 p) (car p))
(define (multiplicand2 p) (caddr p))

;b
