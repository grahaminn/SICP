(define (deriv2 exp var)
     (cond ((number? exp) 0)
           ((variable? exp)
            (if (same-variable? exp var) 1 0))
           (else ((get ’deriv (operator exp))
                  (operands exp) var))))
   (define (operator exp) (car exp))
   (define (operands exp) (cdr exp))

   ;a simple numbers get differentiated to 0, simple vars to either 1 or 0, then we differentiate the operands based on operator as tag. we don't put simple numbers and variables in the table
   ;  because their behavior is completely independent of type tag (operator)
   ;b 
   (put 'deriv '+ 
        (lambda (exp var) (tag (make-sum (deriv (addend exp) var)
                          (deriv (augend exp) var)))))
   (put 'deriv '*
        (lambda (exp var) (tag (make-product (multiplier exp) (deriv (multiplicand exp)) (make-product
                           (deriv (multiplier exp) var)
                           (multiplicand exp)))))
   ;c)      
   (put 'deriv '**
        (lambda (exp var) (tag (make-product 
                                (make-product (exponent exp) 
                                              (make-exponentiation (base exp) (- (exponent exp) 1))) 
                                (deriv (base exp) var)))))
