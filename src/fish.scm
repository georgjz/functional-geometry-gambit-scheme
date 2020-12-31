;;;;;; This file contains all functions to draw the fish

;;;;;; The Fish 
;;; Outline
(define outline-base 
  (primitive-picture '((1. 1.)
                       (0.77916 0.95833)
                       (0.69027 0.95555)
                       (0.56250 0.96527)
                       (0.39333 0.82916)
                       (0.25555 0.74444)
                       (0. 1.))))

(define outline-left (rot-corner outline-base))

(define outline-top (flip (rot45 outline-base)))

(define outline-right (flip-vertical (rot45 outline-base)))

(define fish-outline 
  (over 
   (over outline-base 
         outline-left)
   (over outline-top 
         outline-right)))

;;; Fins and details
(define right-fin 
  (over 
   (over 
    (over (primitive-picture '((0.5 0.5)
                               (0.37777 0.62222)
                               (0.49999 0.75555)))
          (primitive-picture '((0.45222 0.58333)
                               (0.46944 0.60555)
                               (0.48611 0.61666))))
    (over (primitive-picture '((0.42222 0.61388)
                               (0.43888 0.65000)
                               (0.48750 0.67222)))
          (primitive-picture '((0.30138 0.29444)
                               (0.38611 0.27777)
                               (0.48750 0.31388)))))
   (over (primitive-picture '((0.34027 0.39444)
                              (0.40000 0.36527)
                              (0.48611 0.37638)))
         (primitive-picture '((0.34861 0.49722)
                              (0.40277 0.45000)
                              (0.48333 0.43888))))))

(define left-fin 
  (over 
   (over (primitive-picture '((0.00277 0.56250)
                              (-0.09222 0.63611)
                              (-0.17222 0.76111)))
         (primitive-picture '((0.04722 0.61666)
                              (-0.04166 0.68888)
                              (-0.11666 0.80833))))
   (over (primitive-picture '((0.1     0.67777)
                              (0.00555 0.75555)
                              (-0.05833 0.86944)))
         (primitive-picture '((0.15833 0.71666)
                              (0.05833 0.81388)
                              (-0.02222 0.93333))))))

(define fins (over left-fin right-fin))

;;; Body and eyes
(define body 
  (over 
   (primitive-picture '((-0.03473 0.43750)
                        (0.04166 0.58611)
                        (0.06944 0.63333)
                        (0.12222 0.67777)
                        (0.25555 0.74444)))
   (primitive-picture '((0.17708 0.13263)
                        (0.26666 0.24444)
                        (0.29444 0.30000)
                        (0.30277 0.45277)
                        (0.31388 0.51944)
                        (0.37777 0.62222)))))

(define eyes 
  (over 
   (primitive-picture '((0.10833 0.15833)
                        (0.18888 0.25277)
                        (0.12777 0.28333)
                        (0.10833 0.15833)))
   (primitive-picture '((0.05277 0.18333)
                        (0.07777 0.20277)
                        (0.09722 0.30277)
                        (0.05000 0.34722)
                        (0.04166 0.26666)
                        (0.05277 0.18333)))))

(define back 
  (primitive-picture '((0.11666 0.30277)
                       (0.23055 0.57222)
                       (0.31666 0.68333)
                       (0.40833 0.74444)
                       (0.81111 0.91944))))


(define fish 
  (over 
   (over 
    (over fish-outline body)
    (over body eyes))
   (over back fins)))
