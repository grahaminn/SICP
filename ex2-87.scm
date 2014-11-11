(define (isZero? terms)
  (or (null? terms) 
      (and (=zero? (coeff (car terms))) 
           (isZero (cdr terms))
      )
  )
)

;; line to add to install-polynomial
(put '=zero? 'polynomial (lambda (p) (isZero (term-list p))))

 
