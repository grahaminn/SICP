(define (mystery x)
  (define (loop x y)
    (if (null? x)
        y
        (let ((temp (cdr x)))
          (set-cdr! x y)
          (loop temp x))))
  (loop x '()))

(define v (list 'a 'b 'c 'd))

(define w (mystery v))

; a b c d 

; a b c d null

; temp = b c d x = a 

; temp = c d x = b a

; temp = d x = c b a

; temp = () x = d c b a

w 

