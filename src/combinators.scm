;;;;;; These combinators use the primitive picture manipulators to create more
;;;;;; complex images.

(define quartet 
  (lambda (p q r s)
    (above (beside p q) 
           (beside r s))))

(define cycle 
  (lambda (p)
    (quartet p 
             (rot p)
             (rot (rot p))
             (rot (rot (rot p))))))


(define rec-figure 
  (lambda (picture depth)
    (letrec ((R (lambda (depth)
                  (if (zero? depth)
                      blank
                      (quartet picture 
                               (R (- depth 1)) 
                               (R (- depth 1)) 
                               (R (- depth 1)))))))
      (R depth))))