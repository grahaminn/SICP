(define (make-mobile left right) (list left right))

(define (make-branch length structure) (list length structure))

(define (left-branch1 mobile) (list-ref mobile 0))
(define (right-branch1 mobile) (list-ref mobile 1))

;a
(define (branch-length branch) (list-ref branch 0))
(define (branch-structure branch) (list-ref branch 1))

;b
(define (weigh branch)
  (if (pair? (branch-structure branch))
      (+ (weigh (left-branch1 branch)) (weigh (right-branch branch)))
      (branch-structure branch)))


(define (total-weight mobile) (weigh (left-branch1 mobile) (weigh (right-branch mobile))))

;c

(define (balanced mobile) (= (weigh (left-branch1 mobile)) (weigh (right-branch mobile))))

;d right-branch, and branch-structure need to change from list-ref .. 1 to (cdr ...)
