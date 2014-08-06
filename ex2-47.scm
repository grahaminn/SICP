(define (make-frame1 origin edge1 edge2) (list origin edge1 edge2))
(define (edge1-frame1 frame) (list-ref frame 1))
(define (edge2-frame1 frame) (list-ref frame 2))

(define (make-frame2 origin edge1 edge2) (cons origin (cons edge1 edge2)))
(define (edge1-frame2 frame) (car (cdr frame)))
(define (edge2-frame2 frame) (cdr (cdr frame)))
