//
//  8_LongestCommonPrefix.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/8/24.
//
/* 最长公共前缀
 
 编写一个函数来查找字符串数组中的最长公共前缀。

 如果不存在公共前缀，返回空字符串 ""。
 
 
 示例 1：

 输入：strs = ["flower","flow","flight"]
 输出："fl"
 示例 2：

 输入：strs = ["dog","racecar","car"]
 输出：""
 解释：输入不存在公共前缀。
 
 */

import Foundation

// 思考：要判断最长的前缀
// 先考虑初始条件
func longestCommonPrefix(_ strs: [String]) -> String {
    guard strs.count > 1 else { return strs[0] }

    let array = strs.map { Array($0) }

    // 1、把第一个元素提取出来
    let first = array.first!
    var result = ""

    // 2、遍历第一个元素，将每一个元素 都和数组中其他元素相同位置比较
    for (index, value) in first.enumerated() {
        for element in array {
            if index >= element.count || element[index] != value {
                return result
            }
        }
        
        result = result + String(value)
    }

    return result
}
