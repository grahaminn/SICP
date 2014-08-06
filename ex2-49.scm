(define (draw-line f1 s1 s2) (list s1 s2))
(define (frame-coord-map f) f)

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame) (start-segment segment))
        ((frame-coord-map frame) (end-segment segment))))
     segment-list)))

(define (frame-outline frame1) 
  (segments->painter (list (edge1-frame1 frame1) (edge2-frame1 frame1) )))
