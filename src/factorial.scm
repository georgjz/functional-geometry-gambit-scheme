;;; Simple recursive factorial function 
(define factorial 
  (lambda (n)
    (if (zero? n) 
        1
        (* n (factorial (- n 1))))))
