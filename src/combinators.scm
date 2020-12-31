;;;;;; These combinators use the primitive picture manipulators to create more
;;;;;; complex images.

(define flip-vertical 
  (lambda (p)
    (flip (rot (rot p)))))

(define quartet 
  (lambda (p q r s)
    (above (beside p q) 
           (beside r s))))

(define cycle 
  (lambda (p)
    (quartet p 
             (rot (rot (rot p)))
             (rot p)
             (rot (rot p)))))

(define nonet 
  (lambda (p q r  
           s t u 
           v w x)
    (above-ratioed 1. 
                   2. 
                   (beside-ratioed 1. 2. p (beside-ratioed 1. 1. q r))
                   (above-ratioed 1. 
                                  1.
                                  (beside-ratioed 1. 2. s (beside-ratioed 1. 1. t u))
                                  (beside-ratioed 1. 2. v (beside-ratioed 1. 1. w x))))))

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