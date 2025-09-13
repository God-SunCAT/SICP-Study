
; (define (good-enough? guess x)
;         (< (abs (- (square guess) x)) 0.001)
; )

(define (good-enough? old-guess new-guess)
    (> 0.01
       (/ (abs (- new-guess old-guess))
          old-guess)))
(define (average x y)
        (/ (+ x y) 2)
)
(define (improve guess x)
        (average (/ x guess) guess)
)

(define (sqrt-iter guess x)
    (if (good-enough? guess (improve guess x))  ; 调用新的 good-enough?
        (improve guess x)
        (sqrt-iter (improve guess x)
                   x)))
(display (sqrt-iter 1.0 900000000000000000000000000000000000000000000000000000000000000000000000000000000000))
