;;;;;; This stratum describes a language to create picture primitives from two
;;;;;; kinds of shapes: lines and Bezier curves

; (define-structure line start end thickness color)

;;; A picture is a function that takes a box/three vectors and calls the render
;;; function 
; (define picture 
;   (lambda (box)
;     'implement-me))

;;; Takes a list of shapes (lines, curves) and returns a picture function 
; (define primitive-picture
;   (lambda (los)
;     (lambda (box)
;       (letrec ((shapes los)
;                (mapper (lambda (shape)
;                          )))
;       'implement-me)))