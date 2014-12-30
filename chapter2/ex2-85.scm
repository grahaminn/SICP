(define (canSimplify? arg)
  (let (project-op (get 'project (type-tag arg))) 
    (if (project-op)  
      (equ? arg (raise (project-op arg)))
      false
    )
  )
)

(put 'project 'complex (lambda (x) (real-part x)))

(define (simplify x)
  (if (canSimplify? x)
      (simplify ((get 'push (type-tag x)) x))
      x))

 
