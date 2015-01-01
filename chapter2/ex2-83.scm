(define (install-integer-package)
  (define (tag x)
    (attach-tag 'integer x))    
  (put 'add '(integer integer)
       (lambda (x y) (tag (+ x y))))
  (put 'sub '(integer integer)
       (lambda (x y) (tag (- x y))))
  (put 'mul '(integer integer)
       (lambda (x y) (tag (* x y))))
  (put 'div '(integer integer)
       (lambda (x y) (tag (/ x y))))
  (put 'make 'integer
       (lambda (x) (tag x)))

  (define (raise x) (apply-generic 'raise x))

  (put 'raise 'integer (lambda (x) (make-rational x 1)))

  (put 'raise 'rational (lambda (x) (make-real (/ (numer x) (denom x)))))

  (put 'raise 'real (lambda (x) (make-from-real-imag x 0))) 
