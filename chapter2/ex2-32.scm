(define (subsets s)
         (if (null? s)
             (list '())
             (let ((rest (subsets (cdr s))))
              (append rest (map (lambda (x) (cons (car s) x)) rest)))))

;This works because it recursively pairs the head of every subset with the tails of all subsets.
