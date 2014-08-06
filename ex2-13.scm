;a,b * c,d = a*c, b*d
;tolerance(a,b) = 2b/(a+b)-1
;tolerance(c,d) = 2d/(c+d)-1
;tolerance(ac,bd) = 2bd/(ac+bd)-1

;tolerance(a,b)+tolerance(c,d) = -2 + (2b(c+d) + 2d(a+b)) / (a+b)(c+d) = 2bd/(ac+db) - 1

;(2b(c+d) + 2d(a+b))/(a+b)(c+d) - 1 = 2bd/(ac+bd)

;interval1 = (a,tol1) = a - atol1, a + atol1
;interval2 = (b,tol2) = b - btol2, b + btol2
;interval1 * interval2 =  (a-atol1)(b-btol2),(a+atol1)(b+btol2)
;centre = ab -abtol2 - abtol1 + tol1tol2 + ab +abtol1 + abtol2 + tol1tol2 / 2 = ab + (tol1tol2/2)
; tolerance int1* int2 = ab + abtol1 + abtol2 / ab = 1 + tol1 + tol2 (where tol1tol2 is small enough to become zero)
