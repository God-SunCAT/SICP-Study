; 目的：以美分为单位，将其拆分为 1 5 10 25 50不限数量的货币
; 方案：以递归为整体方案
; 需要考虑单一货币连续使用以及混合外币

(define (count-change amount)
        (cc amount 5)
)
(define (first-denomination kinds)
        (cond ((= kinds 1) 1)
              ((= kinds 2) 5)
              ((= kinds 3) 10)
              ((= kinds 4) 25)
              ((= kinds 5) 50)
        )
)
(define (cc amount kinds)
        ; 需要考虑特殊情况
        ; amount = 0 -> 1
        ; amount < fd -> 0
        ; 需要考虑分支
        ; 既然需要考虑不使用某种货币，则应该有一分支用来跳过某货币，并且应该有一分支用来枚举
        ; 枚举分支怎么写？？？
        (cond ((= amount 0) 1)
              ((or (= kinds 0) (< amount 0)) 0)
            ;   为什么下面这一个条件不成立？为什么会导致死循环？
            ;   下方第一个条件应该是跳过这一面值，而不是因为这一面值结束后续全部分支
            ;   下方第二个条件就更无意义了
            ;   ((and (> (first-denomination kinds) amount) (= kinds 1)) 0)
              (else (+ (cc amount (- kinds 1))
                       (cc (- amount (first-denomination kinds)) kinds) 
                    )
              )
        )
)
; 我有个有问题哈，现在真的还用得到递归这种东西吗？思考起来如此复杂，而且替换方式很多。
; 递归的思维意义远大于工程意义，工程上很少用递归这种东西。
(display (count-change 3))