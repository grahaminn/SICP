(put '=zero? '(scheme-number scheme-number) (lambda (x) (= x 0)))

(put '=zero? '(rational rational) (lambda (x) (= 0 (numer x))))

(put '=zero? '(complex complex) (lambda (x) (and (= 0 (real x)) (= 0 (complex x)))))
