

; y = ((x/y*y)+2y)/3

(define (cube x) (expt x 3))
(define (sqr x) (expt x 2))


(define (cuberoot_slow x)(* 1.0 (cuberootiter 1 x 0)))

(define (cuberoot_fast x)(* 1.0 (cuberootiter 1.0 x 0)))

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


(cuberoot_fast 27)
(cuberoot_fast 64)
(cuberoot_fast 125)
(cuberoot_fast 8)

(cuberoot_slow 27)
(cuberoot_slow 64)
(cuberoot_slow 125)
(cuberoot_slow 8)



