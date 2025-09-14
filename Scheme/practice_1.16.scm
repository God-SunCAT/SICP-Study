; 目的：使用迭代的方式实现fast-expt -> b^n
; 方法: 正向迭代，x -> 当前已迭代次方，n -> 目标次方，每次迭代校验 2*x 与 n 的关系
;   若 2*x <= n 则本体相乘迭代，否则使用原始底数进行迭代

; iter(i x b n) -> 分别对应于 当前数值i 当前次方x 底数b 目标迭代次数n

(define (fast-expt b n)
    (if (= n 0)
        1
        (iter b 1 b n)
    )
)

(define (iter i x b n)
    (cond 
        ((= x n) i)
        ((> (* 2 x) n) (iter (* i b) (+ x 1) b n))
        (else (iter (* i i) (* 2 x) b n))
    )
)

(display (fast-expt 2 0))