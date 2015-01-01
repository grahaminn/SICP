(define (square x) (* x x))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0) (/ trials-passed trials))
          ((experiment) (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (integration-experiment x1 y1 x2 y2 pred) (lambda () (pred (random-in-range x1 x2) (random-in-range y1 y2))))

(define (area x1 y1 x2 y2) (* (- x2 x1) (- y2 y1)))

(define (estimate-integral x1 y1 x2 y2 pred trials) (* (area x1 y1 x2 y2)
 (monte-carlo trials (integration-experiment x1 y1 x2 y2 pred))))

(estimate-integral 0 0 4 4 (lambda (x y) (<= (+ (square (- x 2)) (square (- y 2))) 4)) 10000)

(define (estimate-pi r trials) (/ (estimate-integral 0 0 (* 2 r) (* 2 r) (lambda (x y) (<= (+ (square (- x r)) (square (- y r))) (square r))) trials) (square r)))

(estimate-pi 3 10000)
