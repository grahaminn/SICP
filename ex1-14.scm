(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))


;; (count-change 11)
; (cc 11 5)
; (+ (cc 11 4) (cc (- 11 50) 5))
; (+ (+ (cc 11 3) (cc (- 11 25) 4)) (cc -39 5))
; (+ (+ (+ (cc 11 2) (cc (- 11 10) 3)) (cc -14 4)) (cc -39 5))
; (+ (+ (+ (+ (cc 11 1) (cc (- 11 5) 2)) (cc 1 3)) (cc -14 4)) (cc -39 5))
;; etc...

;; count-change space order of growth: O(n)   [max depth is n]
;; count-change time order of growth:
;;   cc(n, 1) = O(n)
;;   cc(n, 2) = cc(n, 1) + cc(n-5, 2)         [each is step O(n), and ~ n/5 steps]
;;   O(n^2)]
;;   analogously, O(n^k) (k currencies) for cc(n, k)
