//
//  11_GenerateParentheses.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/8/25.
//
//  括号生成
/*
  
 数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。
 有效括号组合需满足：左括号必须以正确的顺序闭合。

 示例 1：
 输入：n = 3
 输出：["((()))","(()())","(())()","()(())","()()()"]
 
 示例 2：
 输入：n = 1
 输出：["()"]
 
 */

import Foundation

func generateParenthesis(_ n: Int) -> [String] {
    var result: [String] = []
    
    backTracking(&result, "", 0, 0, n)
    
    return result
}

// 回溯算法
fileprivate func backTracking(_ result: inout [String], _ s: String, _ left: Int, _ right: Int, _ n: Int) {
    // 注意最后left和right都是等于n的
    if left == n && right == n {
        result.append(s)
    }
    
    // 当左边小于n的时候，可以直接添加 "("
    if left < n {
        backTracking(&result, s + "(", left + 1, right, n)
    }
    
    // 当右边小于n的时候，可以直接添加 ")"
    if right < left {
        backTracking(&result, s + ")", left, right+1, n)
    }
}

