

; y = ((x/y*y)+2y)/3

(define (cube x) (expt x 3))
(define (sqr x) (expt x 2))


(define (cuberoot x)(* 1.0 (cuberootiter 1 x 0)))

(define (goodenough_old y x i)
  (if (< i 15)
    ( < (abs ( - (cube y) x) ) 1  )
    1
  )
)

(define (goodenough2 y x i)
  (if (< i 15)
    ( < (abs (- 1 (/ (cube y) x) )) (/ 1 100000000)  )
    1
  )
)

(define (goodenough y x i)
  (if (< i 15)
    ( < (abs (- 1 (/ (cube y) x) )) 0.00000000001  )
    1
  )
)


(define (cuberootiter y x i)
  (write i)
  (write "  ")
  (write-line (* 1.0 y))
  ( if (goodenough y x i)
    y
    (cuberootiter  (/ ( + (/ x (sqr y) ) (* 2 y) )   3  )
                   x
                   (+ i 1)
    )
  )
)


(cuberoot 27)
(cuberoot 64)
(cuberoot 125)
(cuberoot 8)




