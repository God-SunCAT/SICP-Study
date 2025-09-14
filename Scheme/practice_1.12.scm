; 目的：使用递归的方式输出帕斯卡三角形
; 使用递归的方式确实可以完成各个节点的求解，但问题在于，如何输出各个节点？
; 树形计算是从左支到右支
; 使用列表记录各行长度，每次传参传入层数，然后读取层数对应的各行长度进行显示追加
; 拆分：lst作为全局变量存储长度列别
;       (print-add row x) 用于自动读取lst并追加输出“x ”
;       (pascal n) 递归输出n行

(define (make-list x)
        (if (= x 0)
            '()
            (cons "" (make-list (- x 1)))
        )       
)

; 根据索引修改列表直接抄的ChatGPT
(define (list-set! lst index val)
  (if (= index 0)
      (set-car! lst val)
      (list-set! (cdr lst) (- index 1) val)))

(define (print-add lst row x)
        (if (< (length lst) row)
            0 ; 无效行数，在本程序中用不到，但还是考虑上了
            (begin 
                (list-set! lst (- row 1) (string-append (list-ref lst (- row 1)) (number->string x) " "))
            )
        )
)
; 显示lst文本
; x为迭代数据 起始为0
(define (show-lst lst x)
        (if (= x (length lst))
            0
            (begin (display (list-ref lst x)) ; display只接受一个参数
                   (newline)
                   (show-lst lst (+ x 1))
            )
        )
)

; 前期准备工作完成,开始本体 pascal 编写
; 递归的核心就是在于如何写出递归函数，即下一项关于前n项的关系。可找零钱问题到底是什么？找零问题是逻辑分支。
; 找零钱问题将逻辑分为了 本次用或不用用这一货币，如果不用这种货币，那么就去用别的。
; 本次问题可以拆解为：
; f(r,c) = f(r-1, c-1) + f(r-1, c)
; 当 r = 0 或 row + 1时，返回0
(define (pascal n)
    (pascal-show-recur (make-list n) 1 1 n)
)
; 递归显示
(define (pascal-show-recur lst r c n)
    (cond 
        ((and (> c r) (= r n)) lst)
        ((and (> c r) (< r n)) (pascal-show-recur lst (+ r 1) 1 n))
        (else (begin (print-add lst r (pascal-recur r c)) (pascal-show-recur lst r (+ c 1) n)))
    )
)
; 递归函数求值
(define (pascal-recur r c)
        (cond ((or (= c 0) (= c (+ r 1))) 0)
              ((and (= r 1) (= c 1)) 1)
              (else (+ (pascal-recur (- r 1) (- c 1)) (pascal-recur (- r 1) c)))
        )
)
(define x (pascal 10))
(show-lst x 0)
; 递归的核心就在于递推公式与特殊情况的考虑。太费脑子了，还是循环好使