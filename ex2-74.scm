 ;a
 (define (get-record employee division) (get employee division))
 
 ;b
 (define (get-salary employee division) (salary (get-record employee division)))
 
 ;c
 (define (find-employee-record employee divisions)
   (if (null? divisions)
       '()
       (if (null? (get-record employee (car divisions)))
           (find-employee-record employee (cdr divisions))
           (get-record employee (car divisions)))))
