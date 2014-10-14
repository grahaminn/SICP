(define (search-type-coercions-iter type-tags type-tag-subs  op)
  (if (pair? type-tag-subs)
       (let ((t1->t2 (get-coercion type1 type2))
       (map (lambda (x) (get-coercion x (car type-tag-subs))) type-tags) 


(define (search-type-coercions type-tags op)
  (if (get op type-tags) 
      type-tags
      (search-type-coercions-iter type-tags type-tags op))) 



(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
        (apply proc (map contents args))
            (let ((type (car type-tags))
                  (type2 (cadr type-tags))
                  (a1 (car args))
                  (a2 (cadr args)))
              (let ((t1->t2 (get-coercion type1 type2))
                    (t2->t1 (get-coercion type2 type1)))
                (cond (t1->t2
                       (apply-generic op (t1->t2 a1) a2))
                      (t2->t1
                       (apply-generic op a1 (t2->t1 a2)))
                      (else
                       (error "No method for these types"
                              (list op type-tags))))))
            (error "No method for these types"
                   (list op type-tags))))))



