; Without higher-order procedures
;(define (scale-tree tree factor)
;     (cond ((null? tree) nil)
;           ((not (pair? tree)) (* tree factor))
;           (else (cons (scale-tree (car tree) factor)
;                       (scale-tree (cdr tree) factor)))))

(define (scale-tree tree factor)
     (map (lambda (sub-tree)
            (if (pair? sub-tree)
                (scale-tree sub-tree factor)
                (* sub-tree factor)))
tree))
  
(define (square-tree1 tree)
  (cond ((null? tree) '())
        ((pair? tree) (cons (square-tree1 (car tree)) (square-tree1 (cdr tree))))
        (else (square tree))))


(define (square-tree2 tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree2 sub-tree)
             (square sub-tree))) tree))
