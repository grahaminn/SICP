(define (split op1 op2) (lambda (painter n) (if (= n 0) (let ((smaller (split painter (- n 1)))))
                                                (op2 painter (op1 smaller smaller)))))
