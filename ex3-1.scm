(define (make-accumulator x)
  (let ((accumulator x)) 
    (lambda (y) (begin (set! accumulator (+ accumulator y)) accumulator))))
