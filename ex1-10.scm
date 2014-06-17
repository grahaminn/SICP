(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A
(- x 1)
(A x (- y 1))
              )
        )
  )
)

1. (define (f n) (A 0 n)) -> 2n

2. (define (g n) (A 1 n)) -> if n=0 0
if n=1 2
if n=2 A(1 2)
A(0 A(1 1)) (subst A(1 1) == 2)
A(0 2)
2*2
4
if n=3 A(1 3)
A(0 A(1 2))
A(0 A(0 A(1 1))) (subst A(0 y) == 2y)
2* 2* A(1 1) (subst (A 1 1) == 2)
2* 2* 2
8
 
Generally:
if n=0 0
otherwise 2^n

3. (define (h n) (A 2 n)) -> if n=0 0
if n=1 2
if n=2 A(2 2)
A(1 A(2 1)) (subst A(2 1) == 2)
A(1 2)
A(0 A(1 1)) (subst A(1 1) == 2)
A(0 2) (subst A(0 y) == 2y)
2*2
4
if n=3 A(2 3)
A(1 A(2 2))
A(1 A(1 A(2 1))) (subst A(2 1) == 2)
A(1 A(1 2))
A(1 A(0 A(1 1))) (subst A(1 1) == 2)
A(1 A(0 2)) (subst A(0 y) == 2y)
A(1 4)
A(0 A(1 3))
A(0 A(0 A(1 2)))
A(0 A(0 A(0 A(1 1)))) (subst A(1 1) == 2)
A(0 A(0 A(0 2)))
A(0 A(0 2*2))
A(0 2*2*2)
2*2*2*2
16

Generally:
if n=0 0
otherwise 2^(2^(n-1))
