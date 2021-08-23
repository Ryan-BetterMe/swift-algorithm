//
//  5_RegularExpressionMatching.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/8/19.
//
/* 给你一个字符串 s 和一个字符规律 p，请你来实现一个支持 '.' 和 '*' 的 正则表达式匹配。

 '.' 匹配任意单个字符
 '*' 匹配零个或多个前面的那一个元素
 所谓匹配，是要涵盖 整个 字符串 s的，而不是部分字符串。
 
 示例 1：
 输入：s = "aa" p = "a"
 输出：false
 解释："a" 无法匹配 "aa" 整个字符串。
 */

import Foundation

/// 使用动态规划来做！
/// 三个东西很重要：第一是初始条件  第二是动态方程   第三就是状态转移方程
/* 首先来确定状态转移方程：
 P是匹配数组，S是初始数组
 d[i][j] 表示S数组的前i个元素和P数组的前j个元素是否匹配
 
 注意要点：其实动态规划的核心其实就是暴力破解法，将其转化为状态转移方程
 
1、如果P.chatAt(j) == S.chatAt(i): d[i][j] = d[i-1][j-1]
2、如果P.chatAt(j) == ".": d[i][j] = d[i-1][j-1]
3、如果P.chatAt(j) == "*": 这里有两种子情况
   子情况1：P.chatAt(j-1) != S.chatAt(i): d[i][j] = d[i][j-2]  // 这里的a*代表着空值
   子情况2：P.chatAt(j-1) == S.chatAt(i) || P.chatAt(j-1) == ".":
          d[i][j] = d[i-1][j]  // 在这里：a*代表着多个a
       或者d[i][j] = d[i][j-1]  // 在这里：a*代表着一个a
       或者d[i][j] = d[i][j-2]  // 在这里：a*代表着空值
 */

    /// 注意：其实这是一种自下而上的动态规划的解决方式
    /// 在最下面开始计算一个一个小问题并存储在表格中，然后再根据小问题的结果计算大的问题
func isMatch(_ s: String, _ p: String) -> Bool {
    let basicStr = Array(s)
    let patternStr = Array(p)

    let basicCount = basicStr.count
    let patternCount = patternStr.count

    // dp[i][j] 表示s前面i个元素 和 p前面j个元素相等
    var dp = Array.init(repeating: Array.init(repeating:false,
                                             count: patternCount+1),
                       count: basicCount+1)

    // 因为这是自下而上的方式，所以M[i][0] 和 M[0][j]的值是需要同时也是可以知道的
    // 初始条件
    // 1、空字符串匹配空模板字符串
    dp[0][0] = true

    // 2、dp[i][0] = false 这是数组初始化的默认值 因为空pattern肯定是无法匹配非空的字符串的
    // 3、dp[0][j]：什么pattern可以匹配空字符串呢? 那当然就是#*#*#*#*#* 那么pattern的长度是偶数，而且偶数位的字符应该是*
    //              而对于奇数位的长度 dp[o][j] 它的默认值就是false
    // dp的j表示前j个元素，那么在p中的下标为j-1
    
    for j in stride(from: 2, to: patternCount+1, by:2) {
        if patternStr[j-1] == "*" && dp[0][j-2] {
            dp[0][j] = true
        }
    }

    // 动态方程
    // 注意字符串数组下标是i,j 但是对应的元素个数确是i+1，j+1个
    for i in 1..<basicCount + 1 {
        for j in 1..<patternCount + 1 {
            // p下标为j-1 对应dp数组中就是前j个元素
            // (1) 当p中第j个元素为 . 这个时候因为可以替代s中任意元素，所以就相当于求p中j-1个元素是否和s中前i-1个元素相同了
            // (2) 当p中的第j个元素和s中的第i个元素相等，那么同上
            if patternStr[j-1] == "." || patternStr[j-1] == basicStr[i-1] {
                dp[i][j] = dp[i-1][j-1]
            // (3) 当p中的第j个元素为*,这个时候如果P前一个元素相和s中第i个元素相等 或者 p中前一个元素为. 那么这个时候
            } else if patternStr[j-1] == "*" {
                // s: a b b b
                // p: a a *
                // 这个时候a* 表示为空 所以 dp[i][j] = dp[i][j-2]
                if patternStr[j-2] != basicStr[i-1] && patternStr[j-2] != "." {
                    dp[i][j] = dp[i][j-2]
                    
                // s: c b a a a
                // p: c a *
                // 这个时候有多重情况 所以 a* 可能为空，可能表示一个a，可能表示多个a
                } else {
                    dp[i][j] = dp[i-1][j] || dp[i-1][j-2] || dp[i][j-2]
                }
            }
        }
    }

    return dp[basicCount][patternCount]
}
