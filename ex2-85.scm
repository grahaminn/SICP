(define (canSimplify? arg)
  (let (project-op (get 'project (type-tag arg))) 
    (if (project-op)  
      (equ? arg (raise (project-op arg)))
      false
    )
  )
)

(put 'project 'complex (lambda (x) (real-part x)))
(put 'project 'real (lambda (x) (make-rational (* x 2) 2)))
(put 'project 'rational (lambda (x) (round (/ (numerator x) (denominator x)))))

(define (simplify x)
  (if (canSimplify? x)
      (simplify ((get 'push (type-tag x)) x))
      x))

