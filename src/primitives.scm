;;;;;; These are the primitive operators that allow basic picture manipulation.
;;;;;; They all take (a) picture(s) as an argument, and return a picture.

(define rot 
  (lambda (picture)
    (lambda (box)
      (let ((offset (+vec (car box) (caddr box)))
            (horiz (*vec (caddr box) -1.0))
            (vert (cadr box)))
        (picture (list offset horiz vert))))))

(define rot-corner 
  (lambda (picture)
    (lambda (box)
      (let ((offset (+vec (car box) 
                          (+vec (*vec (cadr box) -1.0)
                                (caddr box))))
            (horiz (*vec (caddr box) -1.0))
            (vert (cadr box)))
        (picture (list offset horiz vert))))))

(define flip
  (lambda (picture)
    (lambda (box)
      (let ((offset (+vec (car box) (cadr box)))
            (horiz (*vec (cadr box) -1.0))
            (vert (caddr box)))
        (picture (list offset horiz vert))))))

(define above
  (lambda (p1 p2)
    (lambda (box)
      (let* ((upper-offset (car box))
             (lower-offset (+vec upper-offset
                                 (*vec (caddr box) 0.5)))
             (horiz (cadr box))
             (vert (*vec (caddr box) 0.5)))
        (append
         (p1 (list upper-offset horiz vert))
         (p2 (list lower-offset horiz vert)))))))

(define above-ratioed
  (lambda (m n p1 p2)
    (lambda (box)
      (let* ((total (+ m n))
             (upper-offset (car box))
             (lower-offset (+vec upper-offset
                                 (*vec (caddr box) (/ m total))))
             (horiz (cadr box))
             (vertm (*vec (caddr box) (/ m total)))
             (vertn (*vec (caddr box) (/ n total))))
        (append
         (p1 (list upper-offset horiz vertm))
         (p2 (list lower-offset horiz vertn)))))))

(define beside
  (lambda (p1 p2)
    (lambda (box)
      (let* ((right-offset (car box))
             (left-offset (+vec right-offset
                                (*vec (cadr box) 0.5)))
             (horiz (*vec (cadr box) 0.5))
             (vert (caddr box)))
        (append
         (p1 (list right-offset horiz vert))
         (p2 (list left-offset horiz vert)))))))

(define beside-ratioed
  (lambda (m n p1 p2)
    (lambda (box)
      (let* ((total (+ m n))
             (right-offset (car box))
             (left-offset (+vec right-offset
                                (*vec (cadr box) (/ m total))))
             (horizm (*vec (cadr box) (/ m total)))
             (horizn (*vec (cadr box) (/ n total)))
             (vert (caddr box)))
        (append
         (p1 (list right-offset horizm vert))
         (p2 (list left-offset horizn vert)))))))

(define rot45
  (lambda (picture)
    (lambda (box)
      (let ((offset (car box))
            (horiz (*vec (-vec (cadr box) (caddr box))
                         0.5))
            (vert (*vec (+vec (cadr box) (caddr box))
                  0.5)))
         (picture (list offset horiz vert))))))

(define over 
  (lambda (p1 p2)
    (lambda (box)
      (append
       (p1 box)
       (p2 box)))))
