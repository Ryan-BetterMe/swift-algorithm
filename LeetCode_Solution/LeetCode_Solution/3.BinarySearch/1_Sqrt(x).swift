//
//  1_Sqrt(x).swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/12/10.
//

/*
    给你一个非负整数 x ，计算并返回 x 的 算术平方根 。

    由于返回类型是整数，结果只保留 整数部分 ，小数部分将被 舍去 。

    注意：不允许使用任何内置指数函数和算符，例如 pow(x, 0.5) 或者 x ** 0.5 。

     

    示例 1：

    输入：x = 4
    输出：2
    示例 2：

    输入：x = 8
    输出：2
    解释：8 的算术平方根是 2.82842..., 由于返回类型是整数，小数部分将被舍去。
     

    提示：

    0 <= x <= 231 - 1
 */

import Foundation

func mySqrt(_ x: Int) -> Int {
    guard x > 0 else { return 0 }
    
    var left = 1
    var right = x
    
    while left <= right {
        let mid = (left + right)/2
        let value = mid * mid
        if value == x {
            return mid
        } else if value > x {
            right = mid - 1
        } else if value < x {
            left = mid + 1
        }
    }
    
    return right
}

