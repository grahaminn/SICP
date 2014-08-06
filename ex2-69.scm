(define (successive-merge set)
  (if (null? (cdr set))
      (car set)
      (make-code-tree (car set) (successive-merge (cdr set)))))

(define (generate-huffman-tree pairs)
     (successive-merge (make-leaf-set pairs)))
