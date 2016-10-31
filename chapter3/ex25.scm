(define (make-table)
  (define (find-record keys table)
    (if (pair? keys)
		(let ((subtable (assoc (car keys) (cdr table))))
          (if subtable 
            (find-record (cdr keys) subtable)
            false))
        (assoc keys (cdr table)))
  )

  (define (insert-iter! keys value table) 
    (let ((key (car keys)))
      (let ((subtable (assoc key (cdr table))))
        (if (pair? keys)
          (if subtable 
            (insert-iter! (cdr keys) value subtable)
              (let ((new-subtable '()))
                (set-cdr! table (cons (list key new-subtable) (cdr table)))
                (insert-iter! (cdr keys) value new-subtable))
              )

              (let ((record (assoc key (cdr subtable))))
		        (if record
		          (set-cdr! record value)
			      (set-cdr! subtable ((cons key value)
			   				          (cdr subtable)))))))))

  (let ((local-table (list '*table*)))
    (define (insert! keys value) ((insert-iter! keys value local-table) 'ok))

    (define (create-record key value table) (cons (cons key value) (cdr table))) 
              
    (define (lookup keys) 
			(let ((record (find-record keys local-table)))
              (if record
                  (cdr record)
                  false))))

    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation -- TABLE" m))))
    dispatch)
