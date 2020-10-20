(import (_test))

(test-all?-set! #t)
(test-verbose?-set! #t)

(test-group "\033[1;31mVector Arithmetics\033[0m"
  (test-assert 
   "Add two vectors, float" 
   (equal? (+vec '(1.0 2.0) '(3.0 4.0))
           (list (+ 1.0 3.0) (+ 2.0 4.0))))
  (test-assert 
   "Subtract two vectors, float" 
   (equal? (-vec '(1.0 2.0) '(3.0 4.0))
           (list (- 1.0 3.0) (- 2.0 4.0))))
  (test-assert 
   "Multiply vector with float" 
   (equal? (*vec '(1.0 2.0) 2.5)
           (list (* 1.0 2.5) (* 2.0 2.5))))
  (test-assert 
   "Calculate vector dot product" 
   (equal? (*dot '(1.0 2.0) '(2.0 3.0))
           (+ (* 1.0 2.0) (* 2.0 3.0))))
)