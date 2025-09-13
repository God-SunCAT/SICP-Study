
; (define (good-enough? guess x)
;         (< (abs (- (square guess) x)) 0.001)
; )

(define (good-enough? guess x)
        (< (/ (abs (- (improve guess x) guess)) guess) 0.01)
)
(define (average x y)
        (/ (+ x y) 2)
)
(define (improve guess x)
        (average (/ x guess) guess)
)

(define (sqrt-iter guess x)
        (if (good-enough? guess x)
            guess
            (sqrt-iter (improve guess x)
                        x
            )
        )
)
(display (sqrt-iter 1 900000000000000000000000000000000000000000000000000000000000000000000000000000000000))
