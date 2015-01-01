(define (accumulate2 op initial sequence)
     (if (null? sequence)
         initial
         (op (car sequence)
             (accumulate2 op initial (cdr sequence)))))
 
(define (make-position x y) (list x y))
(define (col position) (car position))
(define (row position) (car (cdr position)))

(define empty-board '())

(define (same-row? pos1 pos2) (= (row pos1) (row pos2)))
(define (same-column? pos1 pos2) (= (col pos1) (col pos2)))
(define (same-diagonal? position1 position2) (= (abs (- (col position1) (col position2))) (abs (- (row position1) (row position2)))))

(define (check? pos1 pos2) (or (same-row? pos1 pos2) 
                               (same-column? pos1 pos2) 
                               (same-diagonal? pos1 pos2)))

(define (find k positions) (if (null? positions) 
                                '()
                                (if (= (car (car positions)) k)
                                  (car positions)
                                  (find k (cdr positions)))))

(define (same? pos1 pos2) (and (= (col pos1) (col pos2)) (= (row pos1) (row pos2))))

(define (remove-pos pos positions) (if (null? pos) 
                                       positions 
                                       (filter (lambda (x) (not (same? pos x))) positions)))
                            
(define (safe? k positions) (let ((pos (find k positions))) (if (null? pos) 
                                                                true 
                                                                (null? (filter (lambda(x) (check? pos x)) (remove-pos pos positions))))))

(define (flatmap proc seq)
      (accumulate2 append '() (map proc seq)))

(define (adjoin-position column row board) (cons (make-position column row) board))

(define (queens board-size)
     (define (queen-cols k)
       (if (= k 0)
           (list empty-board)
           (filter
            (lambda (positions) (safe? k positions))
            (flatmap
             (lambda (rest-of-queens)
               (map (lambda (new-row)
                      (adjoin-position new-row k rest-of-queens))
                    (enumerate-interval 1 board-size)))
             (queen-cols (- k 1))))))
     (queen-cols board-size))
