(require-extension srfi-1) ; only needed for chicken scheme

(define (get-coercions target_type type_tags)
  (map (lambda (x) (get-coercion x target_type)) type_tags)
)

(define (test-coercions coercions args) 
  (= (length (filter (lambda (x) (not (null? x)))  coercions)) (length args))
) 

(define (apply-generic-iter try-types op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (pair? try-types)
              (let (try-type (car try-types))
                (let ((coercions (get-coercions try-type type-tags)))
                  (if (test-coercions coercions args) 
                      (apply-generic op (map coercions args))
                      (apply-generic-iter (cdr try-types) op args))))
              (error "No method for these types" (list op type-tags)))))))

; This method will miss cases where coercions to two different types are necessary 
