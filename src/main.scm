;;; Simple example of using the picture language in Gambit Scheme

;;; Some constants 
(define SCREEN-WIDTH 600)
(define SCREEN-HEIGHT 600)
(define BLACK '(0 0 0 255))
(define WHITE '(255 255 255 255))

;;; Define actual data to draw
(define triangle (primitive-picture '((0.85 0.15)
                                      (0.85 0.85)
                                      (0.15 0.85)
                                      (0.85 0.15))))

;;; Initialize the game
(define init-game 
  (lambda ()
    (begin
     (init-window SCREEN-WIDTH 
                  SCREEN-HEIGHT
                  "Functional Geometry with Gambit Scheme")
     (set-target-fps 60)
    )))

;;; This is the render function
(define render 
  (lambda (ll)
    (map render* ll)))

;;; This function takes a list of lines and draws it onto the context 
(define render* 
  (lambda (los)
    (cond 
      ((or (null? los) 
           (null? (cdr los)))
       '())
      (else 
       (begin (draw-line-ex (car los)
                            (cadr los)
                            2.0 
                            BLACK)
              (render* (cdr los)))))))

(define main-loop 
  (lambda () 
    (if (not (window-should-close))
        (begin (begin-drawing)
               (clear-background WHITE)
               ; draw the triangles 
              ;  (render ((above (beside triangle triangle) triangle) '((0.0 0.0) (600.0 0.0) (0.0 600.0))))
              ;  (render ((beside triangle blank) '((0.0 0.0) (600.0 0.0) (0.0 600.0))))
              ;  (render ((rec-figure triangle 5) '((0.0 0.0) (600.0 0.0) (0.0 600.0))))
              ;  (render (triangle '((0.0 0.0) (600.0 0.0) (0.0 600.0))))
               (render ((over triangle (rot (rot triangle))) '((0.0 0.0) (600.0 0.0) (0.0 600.0))))
               (end-drawing)
               (main-loop))
        (begin 
         (close-window)))))

(init-game)
(main-loop)