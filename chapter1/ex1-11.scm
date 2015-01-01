;; A function f is defined by the rule that f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n>= 3.
;; Write a procedure that computes f by means of a recursive process. Write a procedure that computes f by means of an iterative process.

(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) 
         (* 2 (f (- n 2))) 
         (* 3 (f (- n 3))))))

; f(1) == 1, f(2) == 2, f(3) == 2+2=4, f(4) == 3+4+4=11
; f(5) == 11+4+2=17

(define (f-it n)
   (if (< n 3)
       n
       (iter 2 1 0 n)))

(define (iter a b c count)
   (if (< count 3)
       a
       (iter (+ a (* 2 b) (* 3 c))
             a
             b
             (- count 1))))
