(import (_test))

(test-all?-set! #t)
(test-verbose?-set! #t)

(test-group "\033[1;31mVector Arithmetics\033[0m"
  (test-assert 
   "Add two vectors" 
   (equal? (+vec '(1.0 2.0) '(3.0 4.0))
           (list (+ 1.0 3.0) (+ 2.0 4.0))))
  (test-assert 
   "Add three vectors" 
   (equal? (+vec '(1.0 2.0) '(3.0 4.0) '(5.0 6.0))
           (list (+ 1.0 3.0 5.0) (+ 2.0 4.0 6.0))))
  (test-assert 
   "Subtract two vectors" 
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
  (test-assert 
   "Dot product of perpendicular vectors" 
   (zero? (*dot '(3.0 0.0) '(0.0 1.6))))
)