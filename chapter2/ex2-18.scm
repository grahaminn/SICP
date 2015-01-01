; (1 2 3)
; (cons 3 (cons 2 (cons (1)))

(define (append list1 list2)
     (if (null? list1)
         list2
         (cons (car list1) (append (cdr list1) list2))))

(define (reverse list)
  (if (null? list)
      '()
      (append (reverse (cdr list)) (cons (car list) '()))))
