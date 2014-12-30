(define (attach-tag type-tag contents) 
  (if (and (null? type-tag) (number? contents))
      contents
      (cons type-tag contents)))

(define (type-tag datum)
    (cond ((pair? datum) (car datum))
          ((number? datum) '())
          (else (error "Bad tagged datum: TYPE-TAG" datum))))

(define (contents datum)
     (cond ((pair? datum) (car datum))
           ((number? datum) datum)
           (else (error "Bad tagged datum: CONTENTS" datum))))
