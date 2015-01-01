(define (encode message tree)
     (if (null? message)
         '()
         (append (encode-symbol (car message) tree)
                 (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (define (encode-iter symbol tree bits)
    (cond ((null? tree) '())
          ((leaf? tree) (if (eq? symbol (symbol-leaf tree))
                            bits
                            '()))
          (append (encode-iter symbol (left-branch2 tree) (append bits '(0))) (encode-iter symbol (right-branch2 tree) (append bits '(1))))))
  (encode-iter symbol tree '()))
