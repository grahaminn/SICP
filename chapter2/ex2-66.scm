(define (key set) '())

(define (ordered-lookup given-key set-of-records)
  (cond ((null? set-of-records) false)
        ((> given-key (key (entry set-of-records))) (ordered-lookup given-key (right-branch set-of-records)))
        ((= given-key (key (entry set-of-records))) (entry set-of-records))
        (else (ordered-lookup given-key (left-branch set-of-records)))))
