(define (accumulate op initial sequence)
     (if (null? sequence)
         initial
         (if (pair? sequence)
             (op (car sequence) (accumulate op initial (cdr sequence)))
             (op initial sequence))))

(define (map3 p sequence) (accumulate (lambda (x y) (cons (p x) y)) '() sequence))

(define (append2 seq1 seq2) (accumulate cons seq2 seq1))

(define (length2 sequence) (accumulate (lambda (x y) (+ 1 y)) 0 sequence))
