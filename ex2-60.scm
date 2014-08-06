; element-of-set doesn't need to change

(define (adjoin-set-with-duplicates x set)
  (cons x set))

;intersection-set doesn't need to change
(define (union-set-with-duplicates set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else (cons (car set1) (union-set (cdr set1) set2)))))

; these implementations are faster for adding but slower to check if something is already a member.
