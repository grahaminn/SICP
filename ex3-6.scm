(define (rand m) 
  (define x (random-init))
  (define (disp m)
    (cond ((eq? m 'reset) (lambda (y) (set! x y)))
          ((eq? m 'generate) (begin (set! x (rand-update x)) x))))
  disp)


