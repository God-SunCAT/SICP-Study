; 目的：通过倍数加法实现快速乘法
; 方案：参考1.16，只不过将乘法换成了加法

(define (fast-multiply a b)
    (if (or (= a 0) (= b 0))
        0
        (iter a 1 a b)
    )
)

; 当前值i 迭代次数x 底数b 预估次数n
(define (iter i x b n)
    (cond
        ((= x n) i)
        ((> (* 2 x) n) (iter (+ i b) (+ x 1) b n))
        (else (iter (* i 2) (* x 2) b n))
    )
)

(display (fast-multiply 7 9))
; 时间复杂度 log2(b)
; 果然，在嘈杂环境下最适合你的方法是先构建大致思路然后完全自行编写。