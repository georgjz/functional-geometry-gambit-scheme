;;; Simple example of using raylib in Scheme

; (include "raylibbinding/raylib.scm")

;;; Some game constants 
(define screen-width 800)
(define screen-height 600)

;;; Define a camera
(define camera (make-camera '(10.0 10.0 10.0)
                            '(0.0 0.0 0.0)
                            '(0.0 1.0 0.0)
                            45.0
                            CAMERA_PERSPECTIVE))
(define cube-position '(0.0 0.0 0.0))

;;; Initialize the game
(define init-game 
  (lambda ()
    (begin
     (init-window screen-width 
                  screen-height
                  "Raylib with Gambit Scheme")
     (set-target-fps 60)
    )))

(define main-loop 
  (lambda () 
    (if (not (window-should-close))
        (begin (begin-drawing)
               (clear-background RAYWHITE)
               (set! cube-position (list 0.0 
                                         (flsin (get-time)) 
                                         0.0))
                 (begin-mode-3d camera)
                 (draw-cube cube-position 
                            2.0 
                            2.0
                            2.0 
                            RED)
                 (draw-cube-wires cube-position 
                                  2.0
                                  2.0
                                  2.0
                                  MAROON)
                 (draw-grid 10 1.0)
                 (end-mode-3d)
               (draw-text "Welcome to the third dimension!"
                          10 
                          40 
                          20 
                          DARKGRAY)
               (draw-fps 10 10)
               (end-drawing)
               (main-loop))
        (begin 
         (close-window)))))

(init-game)
(main-loop)
