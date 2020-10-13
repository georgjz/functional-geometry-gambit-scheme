;;; Simple example of using raylib in Scheme

; (include "raylibbinding/raylib.scm")

;;; Some game constants 
(define screen-width 800)
(define screen-height 600)

;;; Initialize the game
(define init-game 
  (lambda ()
    (begin
     (init-window screen-width 
                  screen-height
                  "Functional Geometry with Gambit Scheme")
     (set-target-fps 60)
    )))

(define main-loop 
  (lambda () 
    (if (not (window-should-close))
        (begin (begin-drawing)
               (clear-background '(100 200 90 255))
               (end-drawing)
               (main-loop))
        (begin 
         (close-window)))))

(init-game)
(main-loop)
