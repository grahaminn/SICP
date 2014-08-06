(define (square-list3 items)
         (define (iter things answer)
           (if (null? things)
               answer
               (iter (cdr things) (cons (square (car things)) answer))))
(iter items '()))
    
; This produces the results in reverse order because it makes it's tail recursing through items and appending the each head in reverse order, like so:-
;  (a b c) - > (cons (square a) nil)
;  (b c) -> (cons (square b) (cons (square a) nil))
;  (c) -> (cons (square c) (cons (square b) (cons (square a) nil)))
  
(define (square-list4 items)
     (define (iter things answer)
       (if (null? things)
           answer
           (iter (cdr things) (cons answer (square (car things))))))
     (iter items '()))  
                     
; This won't produce a flat list, but a nesting like so (((() 1) 4) 9) We are doing cons of a list to an element, i,e, (cons (1 2) 3) != (1 2 3) but ((1 2) 3)
; We can fix this like so:-

(define (square-list5 items)
     (define (iter things answer)
       (if (null? things)
           answer
           (iter (cdr things) (append answer (cons (square (car things)) '())))))
     (iter items '()))
