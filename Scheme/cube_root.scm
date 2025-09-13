
(define (good-enough? guess x)
        (< (/ (abs (- (improve guess x) guess)) guess) 0.01)
)
(define (improve guess x)
        (/ (+ (/ x (* guess guess guess)) (* 2 guess)) 3)
)

(define (cube-iter guess x)
        (if (good-enough? guess x)
            guess
            (cube-iter (improve guess x)
                        x
            )
        )
)
(display (cube-iter 1.0 9000000))
