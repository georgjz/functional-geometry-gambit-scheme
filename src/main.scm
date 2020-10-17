;;; Simple example of using raylib in Scheme

; (include "raylibbinding/raylib.scm")

;;; Some constants 
(define SCREEN-WIDTH 600)
(define SCREEN-HEIGHT 600)
(define BLACK '(0 0 0 255))
(define WHITE '(255 255 255 255))

;;; Initialize the game
(define init-game 
  (lambda ()
    (begin
     (init-window SCREEN-WIDTH 
                  SCREEN-HEIGHT
                  "Functional Geometry with Gambit Scheme")
     (set-target-fps 60)
    )))

(define main-loop 
  (lambda () 
    (if (not (window-should-close))
        (begin (begin-drawing)
               (clear-background WHITE)
               (draw-line-bezier '(0.0 0.0)
                             '(800.0 600.0)
                             4.0
                             BLACK)
               (end-drawing)
               (main-loop))
        (begin 
         (close-window)))))

(init-game)
(main-loop)
