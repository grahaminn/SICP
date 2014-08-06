(define (fold-right op initial sequence)
     (if (null? sequence)
         initial
         (op (car sequence)
             (accumulate op initial (cdr sequence)))))

(define (fold-left op initial sequence)
     (define (iter result rest)
       (if (null? rest)
           result
           (iter (op result (car rest))
                 (cdr rest))))
     (iter initial sequence))

; 1.5
; 1 / 6
; '(1 (2 (3 ())))
; '(((() 1) 2) 3)

; To give the same result from fold-l and fold-r op must be reflexive, i.e. op x y = op y x

