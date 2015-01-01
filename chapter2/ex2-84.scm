(define apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car args))
                    (a2 (cadr args)))
                (let ((t1->t2 (ascend type1 type2))
                      (t2->t1 (ascend type2 type1)))
                  (cond (t1->t2
                         (apply-generic op (t1->t2 a1) a2))
                        (t2->t1
                         (apply-generic op a1 (t2->t1 a2)))
                        (else
                         (error "No method for these types"
                                (list op type-tags))))))
              (error "No method for these types"
                     (list op type-tags)))))))

(define (ascend arg1 arg2)
  (define (ascend-iter arg1 arg2 raise-op)
    (let (type1 (type-tags arg1)) (type2 (type-tags arg2))
      (if (= type1 type2)
        raise-op
        (let (proc (get 'raise type1))
          (if (proc)
            (ascend-iter (proc type1) type2 (lambda (x) (proc (raise-op x))))
            '())))))
  (ascend-iter arg1 arg2 (lambda (x) x)))


