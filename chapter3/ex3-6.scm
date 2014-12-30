(define (rand m) 
  (define x random-init)
  (define (disp m)
    (cond ((eq? m 'reset) (lambda (y) (set! x y)))
          ((eq? m 'generate) (begin (set! x (rand-update x)) x))))
  disp)

(define random-init 0)
(define (rand-update x) (+ x 1)) ; A not-very-evolved PNRG 
 (rand 'generate) 
 ; 1 
 (rand 'generate) 
 ; 2 
 ((rand 'reset) 0) 
 ; 0 
 (rand 'generate) 
 ; 1 


