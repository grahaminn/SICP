(define (interval-width x) (/ ((- (upper-bound x) (lower-bound x)) 2)))

(define (mul-interval x y)
     (let ((p1 (* (lower-bound x) (lower-bound y)))
           (p2 (* (lower-bound x) (upper-bound y)))
           (p3 (* (upper-bound x) (lower-bound y)))
           (p4 (* (upper-bound x) (upper-bound y))))
       (make-interval (min p1 p2 p3 p4)
                      (max p1 p2 p3 p4))))

; width x = (upper x - lower x) / 2
; for addition a & b
; width (a + b) = (upper (a + b) - lower (a + b)) / 2
; equivalent to (upper a - lower a) / 2 + (upper b - lower b) / 2, therefore width a + b = width a + width b
  
;for subtraction a & b
;width (a - b) = (upper a - lower b) - (lower a - upper b) = (upper a - lower a) + (upper b - lower b) = width a + width b

; for multiplication, we consider the case where lx = 0 ux = 5 ly=0 and uy=2
; p1=0 p2=0 p3=0 and p4=10 the widths here are 5 and 2, but the product interval is 10, 10, giving a width of 0

; for division, this fails when ly or uy are 0
