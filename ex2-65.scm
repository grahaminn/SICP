(define (union-set-ordered-tree set1 set2)
  (list->tree (union-set-with-ordering (tree->list-2 set1) (tree->list-2 set2))))
  
(define (intersection-set-ordered-tree set1 set2)
  (list->tree (intersection-set-ordered-tree (tree->list-2 set1) (tree->list-2 set2))))
