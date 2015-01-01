; -- --
; -- -+
; -- ++
; -+ --
; -+ -+
; -+ ++
; ++ --
; ++ -+
; ++ ++

(define (mul-interval2 x y)
    (let ((lx (lower-bound x))
          (ux (upper-bound x))
          (ly (lower-bound y))
          (uy (upper-bound y)))
    (cond 
          ((and (<= lx 0) (<= ux 0) (<= ly 0) (<= uy 0)) (make-interval (* ux uy) (* lx ly)))
          ((and (<= lx 0) (<= ux 0) (<= ly 0) (> uy 0)) (make-interval (* lx uy) (* ly ux)))
          ((and (<= lx 0) (<= ux 0) (> ly 0) (> uy 0)) (make-interval (* lx uy) (* ux ly)))
          ((and (<= lx 0) (> ux 0) (<= ly 0) (<= uy 0)) (make-interval (* ly ux) (* lx ly)))
          ((and (<= lx 0) (> ux 0) (<= ly 0) (> uy 0)) (make-interval (min (* ly ux) (* lx uy)) (max (* ux uy) (* lx ly))))
          ((and (<= lx 0) (> ux 0) (> ly 0) (> uy 0)) (make-interval (* lx uy) (* ux uy)))
          ((and (> lx 0) (> ux 0) (<= ly 0) (<= uy 0)) (make-interval (* ux ly) (* lx uy)))
          ((and (> lx 0) (> ux 0) (<= ly 0) (> uy 0)) (make-interval (* ly ux) (* ux uy)))
          ((and (> lx 0) (> ux 0) (> ly 0) (> uy 0)) (make-interval (* lx ly) (* ux uy))))))
