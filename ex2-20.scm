(define (same-parity first . items)
  (define (same-parity-iter firstitem resultlist stack)
    (if (null? stack)
        resultlist
        (if (= (remainder firstitem 2) (remainder (car stack) 2))
            (same-parity-iter firstitem (append resultlist (cons (car stack) '())) (cdr stack))
            (same-parity-iter firstitem resultlist (cdr stack)))))
  (same-parity-iter first (cons first '()) items))
; the above works

(define (map2 proc items)
      (if (null? items)
          '()
          (cons (proc (car items))
                (map2 proc (cdr items)))))
