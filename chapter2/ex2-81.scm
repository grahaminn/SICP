; a) infinte recursion as it attempts to recurse to something that it can find an operation for on the same type

; b) apply generic works correctly as is because if an operation is already defined for that type it simply tries to apply it.

;c) 

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car args))
                    (a2 (cadr args)))
                (let ((t1->t2 (get-coercion type1 type2))
                      (t2->t1 (get-coercion type2 type1)))
                  (cond ((and t1->t2 (not (= type1 type2))) 
                         (apply-generic op (t1->t2 a1) a2))
                        ((and t2->t1 (not (= type1 type2)))
                         (apply-generic op a1 (t2->t1 a2)))
                        (else
                         (error "No method for these types"
                                (list op type-tags))))))
              (error "No method for these types"
                     (list op type-tags)))))))i
