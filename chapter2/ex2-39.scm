(define (reverse2 sequence)
(fold-right (lambda (x y) (append y (cons x '()))) '() sequence))

(define (reverse3 sequence)
(fold-left (lambda (x y) (append (cons y '()) x)) '() sequence))
