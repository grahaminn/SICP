;rectangle represented by corner-points
(define (rectangle corner1 corner2) (cons corner1 corner2))
(define (width rectangle) (abs (- (x-point (car rectangle)) (x-point (cdr rectangle)))))
(define (height rectangle)(abs (- (y-point (car rectangle)) (y-point (cdr rectangle)))))

(define (perimeter rectangle) 
  (+ (* (width rectangle) 2)
     (* (height rectangle) 2)))

(define (area rectangle)
  (* (width rectangle)
     (height rectangle)))

;rectangle represented by origin, width and height
(define (rectangle2 origin width height) (cons origin (cons width height)))
(define (width2 rectangle) (car (cdr rectangle)))
(define (height2 rectangle) (cdr (cdr rectangle)))exc 2.2
