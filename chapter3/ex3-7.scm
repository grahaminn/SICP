(define (make-account balance password) 
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch pass m)
    (if (eq? pass password)
      (cond ((eq? m 'checkpass) #t)
            ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            (else (error "Unknown request -- MAKE-ACCOUNT"
                         m)))
      (if (eq? m 'checkpass) 
        #f 
        (error "Incorrect password"))
    )
  )
  dispatch)

(define acc (make-account 100 'secret-password))

(display ((acc 'secret-password 'withdraw) 40))
(newline)
(display ((acc 'secret-password 'deposit) 50))
(newline)

(define (make-joint account origpassword newpassword)
  (define (dispatch pass m)
    (if (eq? pass newpassword)
      (account origpassword m)
      (error "Invalid joint account password")))
  (if (account origpassword 'checkpass)
    dispatch
    (error "You are trying to create a fraudulent joint account!")))

(define joint-account (make-joint acc 'secret-password 'joint-password))

(display ((joint-account 'joint-password 'deposit) 10))
(newline)   
  

