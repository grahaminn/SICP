(define (make-table)
  (define (find-record keys table)
    (if (pair? keys)
		(let ((subtable (assoc (car keys) (cdr table))))
          (if subtable 
            (find-record (cdr keys) subtable)
            false))
        (assoc keys (cdr table)))
  )

    (let ((key (car keys)))
    (if (pair? keys)
        (let ((subtable (assoc key) (cdr table)))
          (if subtable 
            (insert-iter! (cdr keys) value subtable)
            (let ((new-subtable (cons (list key <-think about struct of tables)
            (set-cdr! table ))))

        (let ((record (assoc key (cdr subtable))))
		  (if record
		      (set-cdr! record value)
			  (set-cdr! subtable (cons (cons key value)
			   				           (cdr subtable))))))

  (define (insert! keys value) (insert-iter! keys value local-table))

  (define (create-record key value table) (cons (cons key value) (cdr table))) 
              

  (let ((local-table (list '*table*)))

    (define (lookup keys) 
		(let ((record (find-record keys local-table))
              (if record
                  (cdr record)
                  false))
            false))
        
    (define (insert! keys value)
      (let ((subtable (assoc key-1 (cdr local-table))))
        (if subtable
            (let ((record (assoc key-2 (cdr subtable))))
              (if record
                  (set-cdr! record value)
                  (set-cdr! subtable (create-record key-2 value subtable)))))
            (set-cdr! local-table 
                      (cons (list key-1
                                  (cons key-2 value))
                            (cdr local-table)))))
      'ok)    
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation -- TABLE" m))))
    dispatch))
