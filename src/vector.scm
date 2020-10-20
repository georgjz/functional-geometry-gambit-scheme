;;; Vector help functions 
(define +vec 
  (lambda (a b)
    (map + a b)))

(define *vec 
  (lambda (vec s) 
    (map (lambda (x) (* x s)) vec)))

(define -vec 
  (lambda (a b)
    (+vec a (*vec b -1.0))))

(define *dot 
  (lambda (a b)
    (let ((x1 (car a))
          (y1 (cadr a))
          (x2 (car b))
          (y2 (cadr b)))
      (+ (* x1 x2) (* y1 y2)))))