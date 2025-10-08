; 过程抽象 过程抽象 过程抽象 重要的事情说三遍
; 其抽象对象是过程而非迭代本身
; 迭代本身无法实现 ((a ^ n) ^ m) = a ^ (n * m)，这条公式仅仅适用于乘法
; 但过程是可以实现这条公式的

(define (fib n)
        (fib-iter 1 0 0 1 n)
)

(define (fib-iter a b p q count)
        (cond ((= count 0) b)
              ((even? count)
               (fib-iter a
                         b
                         (+ (* p p) (* q q))
                         (+ (* q q) (* 2 (* p q)))
                         (/ count 2)
                )
              )
              (else (fib-iter (+ (* b q) (* a q) (* a p))
                              (+ (* b p) (* a q))
                              p
                              q
                              (- count 1)
                    )
              )
        )

)

(display (fib 17))