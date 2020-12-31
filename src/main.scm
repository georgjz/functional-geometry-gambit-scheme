;;; Simple example of using the picture language in Gambit Scheme

;;; Helpers 
(define 1+ (lambda (x) (+ x 1)))

(define 1- (lambda (x) (- x 1)))

;;; Some constants 
(define SCREEN-WIDTH 700)
(define SCREEN-HEIGHT 700)
(define BLACK '(0 0 0 255))
(define WHITE '(255 255 255 255))

;;; Define the main box 
(define main-box '((50.0 50.0)
                   (600.0 0.0)
                   (0.0 600.0)))

;;; Useful for testing
; (define unity-box '((0.0 0.0)
;                     (1.0 0.0)
;                     (0.0 1.0)))
                   
;;; The functions to create an Escher-like painting 
(define fish2 (flip (rot45 fish)))

(define fish3 (rot (rot (rot fish2))))

(define t 
  (over fish 
        (over fish2 fish3)))

(define u
  (over (over fish2 
              (rot fish2))
        (over (rot (rot fish2))
              (rot (rot (rot fish2))))))

(define v 
  (cycle (rot t)))

(define side 
  (lambda (n)
    (if (zero? n)
        blank 
        (quartet (side (1- n))
                 (side (1- n))
                 (rot t)
                 t))))

(define corner 
  (lambda (n)
    (if (zero? n)
        blank 
        (quartet (corner (1- n))
                 (side (1- n))
                 (rot (side (1- n)))
                 u))))

(define square-limit 
  (lambda (n)
    (nonet ; first row
           (corner n)     
           (side n)  
           (rot (rot (rot (corner n))))
           ; second row
           (rot (side n))
           u 
           (rot (rot (rot (side n))))
           ; third row
           (rot (corner n))
           (rot (rot (side n))) 
           (rot (rot (corner n))))))

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

;;; This function takes a list of lines and draws them onto the context 
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
               ; draw the fishes
              ;  (render ((cycle (rot t)) main-box))
               (render ((square-limit 2) main-box))
              ;  (render ((beside-ratioed 1. 2. fish (beside-ratioed 1. 1. fish fish)) main-box))
              ;  (render ((nonet fish fish fish 
              ;                  fish fish fish 
              ;                  fish fish fish) main-box))
               (end-drawing)
               (main-loop))
        (begin 
         (close-window)))))

(init-game)
(main-loop)
